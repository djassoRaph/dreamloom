use std::collections::HashMap;
use std::net::SocketAddr;
use std::sync::Arc;
use tokio::net::{TcpListener, TcpStream};
use tokio::sync::{mpsc, RwLock};
use tokio_tungstenite::{accept_async, tungstenite::Message};
use futures_util::{SinkExt, StreamExt};
use serde::{Deserialize, Serialize};
use uuid::Uuid;

// Player connection
type Tx = mpsc::UnboundedSender<Message>;
type PeerMap = Arc<RwLock<HashMap<Uuid, Player>>>;

#[derive(Debug, Clone)]
struct Player {
    id: Uuid,
    name: String,
    tx: Tx,
}

// Message types
#[derive(Debug, Serialize, Deserialize)]
#[serde(tag = "type", rename_all = "lowercase")]
enum ClientMessage {
    Join { name: String },
    Chat { text: String },
    Move { to: Position },
}

#[derive(Debug, Serialize, Deserialize)]
#[serde(tag = "type", rename_all = "lowercase")]
enum ServerMessage {
    System { text: String },
    Chat { from: String, text: String },
    Position { avatar_id: String, pos: Position },
}

#[derive(Debug, Serialize, Deserialize)]
struct Position {
    x: f32,
    y: f32,
}

#[tokio::main]
async fn main() {
    println!("🌙 DreamLoom Server Starting...");

    let addr = "127.0.0.1:8080";
    let listener = TcpListener::bind(&addr).await.expect("Failed to bind");

    println!("✨ Server listening on: {}", addr);
    println!("📡 WebSocket endpoint: ws://{}", addr);

    let peers = PeerMap::new(RwLock::new(HashMap::new()));

    while let Ok((stream, addr)) = listener.accept().await {
        println!("🔌 New connection from: {}", addr);
        tokio::spawn(handle_connection(peers.clone(), stream, addr));
    }
}

async fn handle_connection(peers: PeerMap, stream: TcpStream, addr: SocketAddr) {
    let ws_stream = match accept_async(stream).await {
        Ok(ws) => ws,
        Err(e) => {
            println!("❌ WebSocket handshake failed: {}", e);
            return;
        }
    };

    println!("✅ WebSocket connection established: {}", addr);

    let (mut ws_sender, mut ws_receiver) = ws_stream.split();
    let (tx, mut rx) = mpsc::unbounded_channel();

    let player_id = Uuid::new_v4();
    let mut player_name = format!("Guest{}", &player_id.to_string()[..4]);

    // Task to forward messages from the channel to the WebSocket
    let mut send_task = tokio::spawn(async move {
        while let Some(msg) = rx.recv().await {
            if ws_sender.send(msg).await.is_err() {
                break;
            }
        }
    });

    // Send welcome message
    let welcome_msg = ServerMessage::System {
        text: format!("Welcome to DreamLoom! Your ID: {}", player_id),
    };
    let _ = tx.send(Message::Text(serde_json::to_string(&welcome_msg).unwrap()));

    // Main message handling loop
    while let Some(msg) = ws_receiver.next().await {
        let msg = match msg {
            Ok(msg) => msg,
            Err(e) => {
                println!("❌ WebSocket error from {}: {}", addr, e);
                break;
            }
        };

        match msg {
            Message::Text(text) => {
                println!("📨 Received from {}: {}", player_name, text);

                // Parse client message
                match serde_json::from_str::<ClientMessage>(&text) {
                    Ok(ClientMessage::Join { name }) => {
                        player_name = name.clone();

                        // Add player to peers
                        let player = Player {
                            id: player_id,
                            name: name.clone(),
                            tx: tx.clone(),
                        };
                        peers.write().await.insert(player_id, player);

                        println!("👋 {} joined the server", name);

                        // Broadcast join message
                        let join_msg = ServerMessage::System {
                            text: format!("{} joined the world", name),
                        };
                        broadcast_message(&peers, player_id, &join_msg).await;
                    }

                    Ok(ClientMessage::Chat { text }) => {
                        println!("💬 {} says: {}", player_name, text);

                        // Broadcast chat message
                        let chat_msg = ServerMessage::Chat {
                            from: player_name.clone(),
                            text,
                        };
                        broadcast_message(&peers, player_id, &chat_msg).await;
                    }

                    Ok(ClientMessage::Move { to }) => {
                        println!("🚶 {} moved to ({}, {})", player_name, to.x, to.y);

                        // Broadcast position update
                        let pos_msg = ServerMessage::Position {
                            avatar_id: player_id.to_string(),
                            pos: to,
                        };
                        broadcast_message(&peers, player_id, &pos_msg).await;
                    }

                    Err(e) => {
                        println!("⚠️ Failed to parse message from {}: {}", player_name, e);
                    }
                }
            }

            Message::Close(_) => {
                println!("👋 {} disconnected", player_name);
                break;
            }

            Message::Ping(data) => {
                let _ = tx.send(Message::Pong(data));
            }

            _ => {}
        }
    }

    // Cleanup on disconnect
    println!("🔌 Connection closed: {}", addr);
    peers.write().await.remove(&player_id);

    // Broadcast leave message
    let leave_msg = ServerMessage::System {
        text: format!("{} left the world", player_name),
    };
    broadcast_message(&peers, player_id, &leave_msg).await;

    send_task.abort();
}

async fn broadcast_message(peers: &PeerMap, sender_id: Uuid, message: &ServerMessage) {
    let msg_text = serde_json::to_string(message).unwrap();
    let peers_read = peers.read().await;

    for (id, player) in peers_read.iter() {
        // Send to all players (including sender for confirmation)
        if let Err(e) = player.tx.send(Message::Text(msg_text.clone())) {
            println!("❌ Failed to send message to {}: {}", player.name, e);
        }
    }
}
