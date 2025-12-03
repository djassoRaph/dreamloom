# DreamLoom Server

A Rust WebSocket server for the DreamLoom social MMO.

## Features

- WebSocket-based real-time communication
- Connection handling with unique player IDs
- Chat system with broadcast messaging
- Position updates for player movement
- Async/await with Tokio runtime

## Requirements

- Rust 1.70 or later
- Cargo

## Running the Server

```bash
cargo run
```

The server will start on `ws://localhost:8080`

## Testing

You can test the server with a WebSocket client or by running the Godot client.

Example WebSocket test (using `websocat`):
```bash
websocat ws://localhost:8080
```

Then send:
```json
{"type": "join", "name": "TestPlayer"}
{"type": "chat", "text": "Hello, world!"}
```

## Protocol

### Client → Server Messages

**Join:**
```json
{"type": "join", "name": "PlayerName"}
```

**Chat:**
```json
{"type": "chat", "text": "Message text"}
```

**Move:**
```json
{"type": "move", "to": {"x": 100, "y": 200}}
```

### Server → Client Messages

**System:**
```json
{"type": "system", "text": "System message"}
```

**Chat:**
```json
{"type": "chat", "from": "PlayerName", "text": "Message text"}
```

**Position:**
```json
{"type": "position", "avatar_id": "uuid", "pos": {"x": 100, "y": 200}}
```

## Architecture

- **Tokio**: Async runtime
- **tokio-tungstenite**: WebSocket implementation
- **serde/serde_json**: JSON serialization
- **uuid**: Unique player identifiers

## Development

The server uses:
- Async/await for concurrent connection handling
- Channels for message passing between tasks
- Arc<RwLock<>> for shared state management
- Structured message types with serde
