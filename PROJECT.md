# DreamLoom

**An open-source, AI-enhanced spiritual successor to Furcadia**

*Isometric social worlds meet tabletop RPG mechanics*

---

## Vision

DreamLoom aims to recreate and evolve the magic of classic graphical social worlds like Furcadia — cozy, tile-based isometric spaces where community, creativity, and roleplay thrive. We're building something that feels like home for storytellers, artists, and dreamers, while adding modern capabilities that the original could never have imagined.

Think of it as: **Furcadia + Roll20 + AI assistance**, all open source and self-hostable.

---

## Core Pillars

### 🏠 Cozy Isometric Worlds
Tile-based isometric environments with that specific nostalgic warmth. Not hyper-realistic, not pixel-perfect retro — something in between that feels inviting and imaginative.

### 🎭 Social & Roleplay First
Combat is optional. Stats are optional. What's never optional is the focus on human connection, storytelling, and shared imagination. This is a space for conversation, collaboration, and creativity.

### 🎨 User-Created Dreams
Anyone can create their own spaces ("dreams") with visual editors and scripting. Your imagination is the limit. Share them publicly or keep them private for your friends.

### 🎲 Optional RPG Mechanics
For those who want structure in their roleplay: character sheets, stats, dice rolls, skill checks — all integrated smoothly into the world. Think Roll20's functionality but embedded in a living, breathing isometric space rather than a flat battlemap.

### 🤖 AI Enhancement
AI assists, never replaces:
- Scene descriptions generated on the fly
- NPC dialogue that feels alive
- Dream creation assistance ("describe your tavern, get tile suggestions")
- *Stretch goal:* Per-action animation generation

### 🌐 Self-Hostable Shards
Run your own server for your community. No central authority required. Federated or standalone — your choice.

---

## Target Experience

**For Players:**
- Join a world, create an avatar, explore dreams others have made
- Engage in freeform or structured roleplay
- Roll dice, track stats, play tabletop-style campaigns in a visual space
- Chat in a proper, readable text interface (not a tiny cramped box)

**For Dream Creators:**
- Visual tile editor for building spaces
- Scripting system for interactivity (doors, NPCs, puzzles, games)
- AI tools to accelerate creation
- Share dreams publicly or host them privately

**For Server Hosts:**
- Self-host a shard for your community
- Customize rules, moderation, allowed content
- Connect to other shards or stay independent

---

## Technical Direction

### Client
- **Primary:** Godot 4.x (open source, excellent 2D/isometric support, exports to desktop + web)
- **Secondary:** Web client for zero-install access (later phase)

### Server
- **Language:** Rust or Go (performance, safety, concurrency)
- **Architecture:** Authoritative server, thin client
- **Database:** PostgreSQL for persistence, Redis for real-time state

### AI Integration
- Local model support (llama.cpp, Ollama) for privacy-conscious hosts
- Optional cloud API integration (OpenAI, Anthropic, etc.)
- AI features are always optional and configurable per-shard

### Protocol
- WebSocket-based real-time communication
- Documented, versioned protocol so alternative clients can exist

---

## Roadmap

### Phase 0: Foundation (Current)
- [ ] Project structure and documentation
- [ ] Core design documents
- [ ] Technology decisions finalized
- [ ] Community spaces established (Discord, forums, etc.)

### Phase 1: Proof of Concept
- [ ] Basic Godot client with isometric tile rendering
- [ ] Simple server that handles connections and chat
- [ ] Avatar movement in a shared space
- [ ] Text chat with proper, readable UI

### Phase 2: Core Features
- [ ] User authentication and profiles
- [ ] Avatar customization system
- [ ] Dream creation tools (basic tile editor)
- [ ] Persistence (your character and dreams save)

### Phase 3: Roleplay Tools
- [ ] Character sheets and stats
- [ ] Dice rolling system with chat integration
- [ ] GM/DM tools for structured play
- [ ] Turn-based or freeform mode switching

### Phase 4: Scripting & Interactivity
- [ ] Dream scripting language (DragonSpeak-inspired but modernized)
- [ ] Interactive objects, NPCs, triggers
- [ ] Mini-game framework within dreams

### Phase 5: AI Integration
- [ ] AI-assisted scene descriptions
- [ ] NPC dialogue generation
- [ ] Dream creation assistant
- [ ] Configurable AI backends

### Phase 6: Federation & Polish
- [ ] Shard-to-shard connectivity
- [ ] Dream sharing/discovery
- [ ] Mobile clients
- [ ] Accessibility features

### Stretch Goals
- Per-action AI animation generation
- Voice chat integration
- VR/AR exploration mode

---

## Design Principles

1. **Open by default.** Code, protocols, assets — as much as possible should be open source and documented.

2. **Community over commerce.** No pay-to-win, no exploitative monetization. Sustainable through donations, hosting services, or optional cosmetics at most.

3. **Accessible.** Low system requirements. Works on older hardware. Web client for zero-install play.

4. **Safe spaces.** Built-in moderation tools. Server hosts set their own rules. Easy blocking and reporting.

5. **Nostalgia with progress.** Honor what made Furcadia special while fixing what held it back (looking at you, tiny text box).

6. **AI as a tool, not a replacement.** AI enhances creativity and accessibility. It never replaces human connection or creativity. Always optional, always transparent.

---

## Inspiration & Prior Art

- **Furcadia** — The original graphical MUCK. Cozy, creative, community-driven.
- **Roll20 / Foundry VTT** — Tabletop RPG tools done right.
- **Second Life** — User-created worlds at scale.
- **MUCKs/MUDs** — Text-first, imagination-forward.
- **Minecraft** — Proof that player creativity can be the whole game.
- **Wolveden** — Modern takes on the same space.

---

## Contributing

We welcome contributors of all kinds:
- **Developers** — Client, server, tools
- **Artists** — Tiles, avatars, UI, concept art
- **Writers** — Lore, documentation, tutorials
- **Designers** — UX, game mechanics, systems
- **Testers** — Break things so we can fix them
- **Community builders** — Moderation, outreach, support

See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

---

## License

This project is licensed under **AGPL-3.0** — ensuring it stays open source even when hosted as a service.

Assets may have separate licenses (CC-BY-SA for art, etc.) — see individual asset directories.

---

## Community

*Links to be added as we establish them:*
- Discord: [Coming soon]
- Forums: [Coming soon]
- Matrix: [Coming soon]

---

*Dream big. Weave together. Stay cozy.* 🌙
