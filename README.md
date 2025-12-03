# 🌙 DreamLoom - Open Dreams

**A cozy isometric social MMO for storytellers, roleplayers, and world builders.**

DreamLoom is an open-source, self-hostable graphical social world inspired by Furcadia, combining classic isometric MMO charm with modern RPG tools and AI-enhanced creativity.

## 🎮 What is DreamLoom?

- **Cozy isometric worlds** for social interaction and roleplay
- **User-created spaces** ("dreams") with simple scripting
- **Light RPG mechanics** (dice, stats) for structured play
- **AI-enhanced creativity** turning text into generated art
- **Self-hostable shards** for community autonomy

## 📁 Project Structure

```
opendreams/
├── client/
│   └── dreamloom/          # Godot 4 game client
│       ├── scenes/         # Game scenes (main.tscn)
│       ├── scripts/        # GDScript files
│       ├── assets/         # Game assets (tiles, sprites, audio)
│       └── project.godot   # Godot project file
│
├── server/                 # Rust WebSocket server
│   ├── src/
│   │   └── main.rs         # Server implementation
│   ├── Cargo.toml          # Rust dependencies
│   └── README.md           # Server documentation
│
├── assets/                 # Shared asset source files
│   ├── tiles/              # Isometric tile assets
│   ├── sprites/            # Character and object sprites
│   └── audio/              # Sound effects and music
│
└── docs/                   # Documentation
    ├── GDD.md              # Game Design Document
    ├── PROJECT.md          # Project information
    └── CONTRIBUTING.md     # Contribution guidelines
```

## 🚀 Getting Started

### Prerequisites

**For the Client:**
- [Godot 4.4+](https://godotengine.org/download)

**For the Server:**
- [Rust 1.70+](https://rustup.rs/)
- Cargo (comes with Rust)

### Running the Server

1. Navigate to the server directory:
```bash
cd server
```

2. Build and run the server:
```bash
cargo run
```

The server will start on `ws://localhost:8080`

You should see:
```
🌙 DreamLoom Server Starting...
✨ Server listening on: 127.0.0.1:8080
📡 WebSocket endpoint: ws://127.0.0.1:8080
```

### Running the Client

1. Open Godot 4.4 or later

2. Click "Import" and navigate to:
```
client/dreamloom/project.godot
```

3. Click "Import & Edit"

4. Press F5 or click the Play button to run the game

5. You should see:
   - A connection status indicator (top-left)
   - A chat panel (bottom-left)
   - A player character you can move with WASD or Arrow keys

## 🎯 Current Features

### Client (Godot)
- ✅ Isometric movement system (WASD/Arrow keys)
- ✅ WebSocket connection to server
- ✅ Real-time chat system
- ✅ Connection status indicator
- ✅ Camera follows player
- ✅ Proper input handling for isometric coordinates

### Server (Rust)
- ✅ WebSocket server on port 8080
- ✅ Connection handling with unique player IDs
- ✅ Chat message broadcasting
- ✅ Player join/leave notifications
- ✅ Position update broadcasting
- ✅ Async/await with Tokio

## 🧪 Testing the Connection

Once both server and client are running:

1. Type a message in the chat box
2. Press Enter to send
3. You should see your message appear in the chat history
4. If you run multiple clients, they'll all see each other's messages

## 🎨 Isometric Specifications

DreamLoom uses standard isometric projection:

- **Tile Size:** 64×32 pixels (base)
- **Perspective:** 2:1 ratio isometric
- **Angle:** 26.565° (arctan 0.5)
- **Movement:** Cartesian input converted to isometric coordinates

## 🛠️ Next Steps

This is the foundation! The basic architecture is now in place. Next steps include:

- [ ] TileMap setup with isometric tiles
- [ ] Multiple player rendering
- [ ] Character customization
- [ ] Dream creation tools
- [ ] RPG mechanics (dice, character sheets)
- [ ] AI integration for art generation
- [ ] Database persistence (PostgreSQL)
- [ ] Authentication system

## 📖 Documentation

- **[Game Design Document](docs/GDD.md)** - Full vision and design
- **[Project Information](docs/PROJECT.md)** - Project details
- **[Contributing Guide](docs/CONTRIBUTING.md)** - How to contribute

## 🤝 Contributing

DreamLoom is open source (AGPL-3.0) and welcomes contributions!

See [CONTRIBUTING.md](docs/CONTRIBUTING.md) for guidelines.

## 🔗 Protocol Reference

### Client → Server

```json
{"type": "join", "name": "PlayerName"}
{"type": "chat", "text": "Hello!"}
{"type": "move", "to": {"x": 100, "y": 200}}
```

### Server → Client

```json
{"type": "system", "text": "System message"}
{"type": "chat", "from": "PlayerName", "text": "Hello!"}
{"type": "position", "avatar_id": "uuid", "pos": {"x": 100, "y": 200}}
```

## 📝 License

AGPL-3.0 - See [LICENSE](LICENSE) for details

## 🌟 Philosophy

**Community over commerce.** DreamLoom will never have pay-to-win mechanics, lootboxes, or paywalled gameplay features.

The codebase stays open forever, sustained by community contributions, grants, and optional services around the free core.

---

*Dream big. Weave together. Stay cozy.* 🌙
