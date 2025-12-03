# 🛠️ DreamLoom Development Guide

This guide covers the development setup and workflow for DreamLoom.

## Quick Start

### Terminal 1 - Run the Server
```bash
cd server
cargo run
```

### Terminal 2 - Open Godot
```bash
cd client/dreamloom
# Open project.godot in Godot 4.4+
# Press F5 to run
```

## Development Workflow

### Server Development

The server is in `server/src/main.rs` and uses:
- **Tokio** for async runtime
- **tokio-tungstenite** for WebSocket
- **serde/serde_json** for message serialization

Hot reload: The server needs to be restarted after code changes.
```bash
cd server
cargo run
```

### Client Development

The client is a Godot 4 project in `client/dreamloom/`:
- **scenes/** - Godot scene files (.tscn)
- **scripts/** - GDScript files (.gd)
- **assets/** - Game assets

Godot has hot reload built-in - save files and the running game updates automatically.

## Project Architecture

```
┌─────────────────┐
│  Godot Client   │
│  (GDScript)     │
└────────┬────────┘
         │ WebSocket
         │ (JSON messages)
         │
┌────────┴────────┐
│  Rust Server    │
│  (Tokio async)  │
└─────────────────┘
```

## Key Files

### Client
- `client/dreamloom/project.godot` - Project configuration
- `client/dreamloom/scenes/main.tscn` - Main game scene
- `client/dreamloom/scripts/world.gd` - World manager & networking
- `client/dreamloom/scripts/player.gd` - Player movement & controls

### Server
- `server/src/main.rs` - WebSocket server & game logic
- `server/Cargo.toml` - Rust dependencies

## Adding New Features

### Adding a New Message Type

1. **Define in Server** (`server/src/main.rs`):
```rust
#[derive(Debug, Serialize, Deserialize)]
#[serde(tag = "type", rename_all = "lowercase")]
enum ClientMessage {
    // ... existing types
    NewAction { data: String },
}
```

2. **Handle in Server**:
```rust
Ok(ClientMessage::NewAction { data }) => {
    // Handle the action
}
```

3. **Send from Client** (`client/dreamloom/scripts/world.gd`):
```gdscript
_send_message({"type": "newaction", "data": "value"})
```

### Adding Isometric Tiles

1. Create 64×32 pixel isometric tile sprites
2. Place in `client/dreamloom/assets/tiles/`
3. Import into Godot
4. Create/edit TileSet resource
5. Add to TileMap in main scene

### Adding Player Sprites

1. Create sprite sheets (recommended: 48×64 per frame)
2. Place in `client/dreamloom/assets/sprites/`
3. Import and configure as AnimatedTexture or AnimatedSprite2D
4. Update player.gd to use new sprites

## Debugging

### Server Debugging
```bash
# Run with detailed output
RUST_LOG=debug cargo run

# Check server is listening
curl -i -N -H "Connection: Upgrade" -H "Upgrade: websocket" -H "Sec-WebSocket-Version: 13" -H "Sec-WebSocket-Key: test" http://localhost:8080
```

### Client Debugging
- Open Godot Editor
- Go to "Debugger" tab at bottom
- Run project (F5)
- Watch console output and errors

### Testing WebSocket Manually

Using `websocat` (install: `cargo install websocat`):
```bash
websocat ws://localhost:8080
```

Then type:
```json
{"type":"join","name":"TestPlayer"}
{"type":"chat","text":"Hello from terminal!"}
```

## Code Style

### Rust
- Follow standard Rust formatting (`cargo fmt`)
- Run clippy for lints (`cargo clippy`)
- Use meaningful variable names
- Add comments for complex logic

### GDScript
- Use snake_case for variables and functions
- Use PascalCase for class names
- Add type hints where possible: `var name: String`
- Document complex functions with comments

## Testing

### Manual Testing Checklist
- [ ] Server starts without errors
- [ ] Client connects and shows "Connected"
- [ ] Chat messages send and receive
- [ ] Player can move with WASD/arrows
- [ ] Multiple clients can connect simultaneously
- [ ] Disconnection is handled gracefully

### Adding Automated Tests

For server:
```bash
cd server
cargo test
```

For client: Use Godot's built-in GUT (Godot Unit Test) framework.

## Performance Considerations

### Server
- Messages are broadcast to all connected players
- For 100+ players, consider message filtering by location
- Use Redis for state management at scale

### Client
- TileMap is efficient for large worlds
- Use visibility culling for distant objects
- Limit sprite animations to visible characters

## Common Issues

### "Connection Failed" in Client
- Make sure server is running on port 8080
- Check firewall settings
- Verify WebSocket URL in `world.gd`

### Cargo build fails
- Update Rust: `rustup update`
- Clean build: `cargo clean && cargo build`

### Godot can't find scenes
- Make sure file paths use `res://` prefix
- Check that files are saved
- Reimport project if needed

## Next Development Priorities

Based on the GDD, recommended order:

1. **Visual Assets**
   - Create basic isometric tile set
   - Create simple player sprite
   - Add to TileMap and Player node

2. **Multiplayer Rendering**
   - Show other players on screen
   - Sync positions in real-time
   - Add player name labels

3. **Enhanced Chat**
   - Emote commands (`/me waves`)
   - Whispers (`/w name message`)
   - Chat formatting

4. **Character Sheets**
   - Simple stat system
   - Basic dice rolling
   - Character storage

5. **Dream Creation**
   - In-game tile editor
   - Dream save/load
   - Basic scripting

## Resources

- [Godot Documentation](https://docs.godotengine.org/)
- [Rust Book](https://doc.rust-lang.org/book/)
- [Tokio Tutorial](https://tokio.rs/tokio/tutorial)
- [WebSocket Protocol](https://datatracker.ietf.org/doc/html/rfc6455)
- [Isometric Game Design](https://en.wikipedia.org/wiki/Isometric_video_game_graphics)

## Getting Help

- Check existing issues on GitHub
- Read the GDD for design decisions
- Ask in community discussions

---

Happy coding! 🌙✨
