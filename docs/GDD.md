# DreamLoom — Game Design Document

**Version:** 0.1 (Foundation Draft)  
**Last Updated:** December 2024  
**Status:** Pre-production

---

## Table of Contents

1. [Executive Summary](#1-executive-summary)
2. [Core Concept](#2-core-concept)
3. [Target Audience](#3-target-audience)
4. [Gameplay Overview](#4-gameplay-overview)
5. [World Structure](#5-world-structure)
6. [Avatar System](#6-avatar-system)
7. [Chat & Communication](#7-chat--communication)
8. [RPG Mechanics](#8-rpg-mechanics)
9. [Dream Creation](#9-dream-creation)
10. [AI Integration](#10-ai-integration)
11. [Social Systems](#11-social-systems)
12. [Technical Architecture](#12-technical-architecture)
13. [Art Direction](#13-art-direction)
14. [Audio Direction](#14-audio-direction)
15. [Monetization Philosophy](#15-monetization-philosophy)
16. [Accessibility](#16-accessibility)
17. [Future Considerations](#17-future-considerations)

---

## 1. Executive Summary

**DreamLoom** is an open-source, self-hostable graphical social world that combines the cozy charm of classic isometric MMOs like Furcadia with modern tabletop RPG tools and AI-enhanced creativity.

**Core pillars:**
- Cozy isometric worlds for social interaction and roleplay
- User-created spaces ("dreams") with simple scripting
- Light RPG mechanics (dice, stats) for structured play
- AI that enhances creativity — turning player writing into generated art
- Self-hostable shards for community autonomy

**The magic moment:** A player writes a descriptive roleplay action, hits a button, and sees AI-generated art of what they just described — bringing the theater of the mind to visual life.

---

## 2. Core Concept

### 2.1 What Is DreamLoom?

DreamLoom is a **graphical social platform** where players:
- Create customizable avatars
- Explore isometric tile-based worlds
- Engage in freeform or structured roleplay
- Build and share their own spaces (dreams)
- Use AI to visualize their stories

It is **not** a traditional MMO. There is no leveling treadmill, no endgame grind, no combat requirement. The "game" is human connection, storytelling, and shared creativity.

### 2.2 The Elevator Pitch

> "Imagine if Furcadia, Roll20, and AI art generation had a baby — open source, self-hostable, and built for storytellers."

### 2.3 Core Loop

```
Create Avatar → Explore Dreams → Meet People → Roleplay Together → 
Write Actions → Generate Art → Build Your Own Dream → Share It → Repeat
```

---

## 3. Target Audience

### 3.1 Primary Audiences

**Roleplayers & Storytellers**
- Text-based RPG enthusiasts
- Tabletop RPG players wanting a visual space
- Creative writers who enjoy collaborative fiction
- Former MUD/MUCK/Furcadia players

**World Builders & Creators**
- People who want to design their own spaces
- Game masters who want persistent worlds for campaigns
- Artists who want to see their worlds come alive

**Social Gamers**
- Players seeking cozy, low-pressure online spaces
- Communities wanting a private space to gather
- People tired of toxic competitive gaming environments

### 3.2 Age Range

**Target:** 16+ (content depends on shard rules)

Individual shards can set their own age restrictions and content policies.

---

## 4. Gameplay Overview

### 4.1 Core Activities

| Activity | Description |
|----------|-------------|
| **Exploring** | Walk through dreams, discover new spaces, appreciate creations |
| **Socializing** | Chat, emote, hang out in public or private spaces |
| **Roleplaying** | Freeform storytelling or structured RPG sessions |
| **Creating** | Build dreams using the tile editor and scripting |
| **Visualizing** | Generate AI art from roleplay descriptions |

### 4.2 Session Flow

**Casual Session (30 min):**
1. Log in, appear at home or last location
2. Check messages/notifications
3. Visit a favorite dream or explore new ones
4. Chat with friends or strangers
5. Log out (avatar can remain as "away" or disappear)

**Roleplay Session (2-4 hours):**
1. Group gathers in a dream
2. GM (if any) sets the scene
3. Players take turns describing actions
4. Dice rolls resolve uncertain outcomes
5. AI generates art for key moments
6. Session ends, progress saved to character sheets

### 4.3 Movement & Navigation

- **Click-to-move** — Click a tile, avatar pathfinds there
- **Keyboard movement** — Arrow keys or WASD for direct control
- **Teleportation** — Jump to bookmarked dreams or coordinates
- **Portals** — In-world objects that transport to other dreams

Movement speed is leisurely by default — this isn't an action game.

---

## 5. World Structure

### 5.1 Hierarchy

```
Shard (Server)
└── Hub World (starting area)
    └── Dreams (user-created spaces)
        └── Rooms (connected areas within a dream)
            └── Tiles (individual cells)
```

### 5.2 Shards

A **shard** is a self-contained server instance. Each shard:
- Has its own rules, moderation, and community
- Can be public (anyone can join) or private (invite only)
- Can federate with other shards or remain standalone
- Runs on the host's hardware or cloud

**Official shards** may exist for newcomers, but the goal is community-run servers.

### 5.3 Dreams

A **dream** is a user-created space — DreamLoom's core creative unit.

**Dream properties:**
- Name and description
- Owner and permissions (who can visit, edit, build)
- Size (tile dimensions, can be multi-room)
- Visibility (public, unlisted, private)
- Rating (family-friendly, mature, etc. — shard-dependent)

**Dream types:**
- **Social spaces** — Taverns, parks, hangouts
- **Roleplay stages** — Settings for campaigns or scenes
- **Games** — Puzzles, mazes, mini-games built with scripting
- **Personal spaces** — Private homes, galleries

### 5.4 Persistence

- **Avatar state** — Position, appearance, inventory saved per-shard
- **Dream state** — Can be persistent (changes stay) or resetting
- **Character sheets** — Stored per-avatar, portable across dreams
- **Chat logs** — Optional local saving, server logs per shard policy

---

## 6. Avatar System

### 6.1 Design Philosophy

Avatars should be:
- **Expressive** — Convey personality and mood
- **Diverse** — Support many species, body types, styles
- **Customizable** — Deep options without overwhelming new users
- **Readable** — Clear silhouettes at isometric scale

### 6.2 Avatar Types

DreamLoom supports a broad fantasy spectrum:

| Category | Examples |
|----------|----------|
| **Humanoid** | Humans, elves, dwarves, orcs |
| **Anthro/Hybrid** | Animal-featured humanoids, beast-folk |
| **Fantasy Creatures** | Faeries, demons, angels, elementals |
| **Non-Human** | Robots, slimes, living objects (with humanoid locomotion) |

The avatar system is **modular** — base body + customization layers.

### 6.3 Customization Layers

```
Base Body (species/body type)
├── Skin/Fur/Scale Color & Pattern
├── Head Shape & Features
│   ├── Hair/Horns/Ears
│   ├── Eyes
│   └── Face Markings
├── Body Modifications
│   ├── Tail
│   ├── Wings
│   └── Extra Features
└── Clothing & Accessories
    ├── Outfit Layers
    ├── Held Items
    └── Effects/Auras
```

### 6.4 Avatar Animations

Minimal but expressive:
- Idle (breathing, subtle movement)
- Walking (4 or 8 directions)
- Sitting
- Emotes (wave, laugh, cry, dance, etc.)
- Custom emotes (user-uploaded, shard-approved)

### 6.5 Avatar Portraits

Each avatar has a **portrait** — a larger, more detailed image for:
- Profile display
- Chat headers
- Character sheets
- AI art generation (style reference)

Portraits can be:
- Auto-generated from avatar
- User-uploaded art
- AI-generated from description

---

## 7. Chat & Communication

### 7.1 Design Philosophy

**The chat system is the heart of DreamLoom.**

Furcadia's tiny text box was a constant frustration. DreamLoom prioritizes:
- **Readability** — Large, resizable text area
- **History** — Scroll back through conversation
- **Formatting** — Support for roleplay conventions
- **Accessibility** — Screen reader friendly, dyslexia fonts

### 7.2 Chat Types

| Type | Syntax | Visibility | Use |
|------|--------|------------|-----|
| **Say** | `Hello!` | Nearby avatars | Normal conversation |
| **Emote** | `/me waves` | Nearby avatars | Actions, expressions |
| **Whisper** | `/w Name message` | One person | Private conversation |
| **Party** | `/p message` | Party members | Group coordination |
| **OOC** | `(( message ))` or `/ooc` | Nearby | Out-of-character |
| **Shout** | `/shout message` | Entire dream | Announcements |
| **Narrate** | `/narrate text` | Nearby (GM only) | Scene descriptions |

### 7.3 Roleplay Formatting

**Automatic formatting based on context:**
- Regular text → Speech bubble style
- `/me` actions → *Italicized action text*
- `(( ooc ))` → Grayed, clearly marked as OOC
- `/narrate` → Boxed, distinct narrator style
- Dice rolls → Highlighted result with breakdown

### 7.4 Chat Panels

The UI supports multiple chat panels:
- **Main** — All local chat
- **Party** — Just party chat
- **Whispers** — Private conversations (tabbed by person)
- **System** — Rolls, notifications, server messages

### 7.5 Chat History

- Scrollable history within session
- Optional local log saving
- Search within history
- Timestamp toggle

---

## 8. RPG Mechanics

### 8.1 Design Philosophy

RPG mechanics are **optional enhancements**, not requirements.

Goals:
- Support structured roleplay without forcing it
- Simple enough for newcomers to tabletop
- Flexible enough for experienced GMs to customize
- Never get in the way of freeform play

### 8.2 Character Sheets

Every avatar can have an attached **character sheet**.

**Core Stats (Default Template):**

| Stat | Description |
|------|-------------|
| **Strength** | Physical power, carrying capacity |
| **Agility** | Speed, reflexes, dexterity |
| **Endurance** | Stamina, health, resilience |
| **Intelligence** | Knowledge, reasoning, memory |
| **Wisdom** | Intuition, perception, willpower |
| **Charisma** | Social influence, presence, persuasion |

Stats use a simple **1-10 scale** by default (5 = average).

**Additional Sheet Fields:**
- Name, species, background (text)
- Skills/abilities (freeform list)
- Inventory (freeform list)
- Notes (private or public)
- Portrait

### 8.3 Dice System

**Basic roll:** `/roll XdY` — Roll X dice with Y sides

**Examples:**
- `/roll 1d20` → Rolls a 20-sided die
- `/roll 2d6` → Rolls two 6-sided dice, sums them
- `/roll 1d20+5` → Adds modifier to result

**Stat-linked rolls:** `/roll strength` → Rolls based on stat value

**Roll visibility:**
- Public (everyone sees)
- GM-only (GM and roller see)
- Private (only roller sees)

### 8.4 Skill Checks

Simple resolution system:

1. Player declares action
2. GM calls for a check: "Roll Agility"
3. Player rolls: `/roll agility`
4. System compares to difficulty (set by GM or dream script)
5. Result displayed: Success, Failure, or Critical

**Difficulty scale:**
- Easy: 3
- Medium: 5
- Hard: 7
- Very Hard: 9

### 8.5 GM Tools

**Game Master mode** enables:
- `/narrate` command for scene-setting
- Hidden rolls (see all rolls, players don't see yours)
- NPC puppeting (control temporary characters)
- Difficulty setting for the dream/session
- Turn order tracker (optional)
- Quick stat checks on players

Any dream owner can enable GM mode; they can also grant it to others.

### 8.6 Combat System (Planned)

DreamLoom will include a **simple, optional combat system** — but the details are still being studied.

**Design goals:**
- Simple enough for newcomers, deep enough for tactical fun
- Turn-based to fit text-based interaction
- Uses existing stats (Strength, Agility, etc.)
- Narrative-friendly — dice resolve outcomes, players describe the action
- Optional per-dream — can be disabled entirely

**Current thinking:**
- Opposed rolls (attacker vs defender)
- Health derived from Endurance stat
- **0 HP = Knocked Out** — recovers after scene ends
- **Permadeath only in dreams that enable it** — opt-in, not default

**Open questions we're still exploring:**
- Turn structure: Initiative rolls vs GM-directed vs freeform?
- Damage model: Difference-based, flat per hit, or weapon-based?
- Magic/abilities: Separate system or same roll structure?
- Status effects: Keep it simple or allow conditions (stunned, poisoned)?

**Community input wanted!** If you have experience with tabletop combat systems or ideas for what would work well in DreamLoom, open a discussion on GitHub.

For now, combat can be resolved through:
- Freeform description + GM adjudication
- Simple opposed rolls (`/roll strength` vs `/roll agility`)
- Custom dream scripts (for communities that want their own system)

---

## 9. Dream Creation

### 9.1 Design Philosophy

Dream creation should be:
- **Accessible** — No coding required for basic dreams
- **Powerful** — Deep scripting for advanced creators
- **AI-assisted** — Describe what you want, get suggestions
- **Shareable** — Easy to publish, remix, collaborate

### 9.2 Tile Editor

**Visual editor features:**
- Tile palette (floor, walls, objects, effects)
- Paint / fill / select tools
- Layer system (ground, objects, overhead, effects)
- Copy / paste / undo
- Grid snapping
- Multi-room support with connections

**Tile properties:**
- Walkable / blocked / water / etc.
- Z-level (for bridges, stairs)
- Trigger zones (for scripting)

### 9.3 Scripting System

**DreamScript** — A simple, text-based scripting language inspired by Furcadia's DragonSpeak but modernized.

**Design goals:**
- Readable by non-programmers
- Event-driven (when X happens, do Y)
- Safe (sandboxed, can't affect other dreams or system)
- AI-assistable (describe behavior, get script suggestions)

**Basic syntax:**

```dreamscript
# When a player steps on tile (5, 10)
when player enters (5, 10):
    say "A chill runs down your spine..."
    play sound "wind.ogg"

# When a player says "open sesame" near the door
when player says "open sesame" near "cave_door":
    if door_open is false:
        set door_open to true
        animate "cave_door" "opening"
        say "The stone door grinds open!"
    else:
        say "The door is already open."

# Daily reset
when time is 00:00:
    set door_open to false
    reset all items
```

**Built-in triggers:**
- `when player enters/exits (location)`
- `when player says "text"` / `says containing "text"`
- `when player uses (item)` / `clicks (object)`
- `when time is (HH:MM)` / `after (duration)`
- `when variable (condition)`

**Built-in actions:**
- `say "text"` / `narrate "text"`
- `play sound/music`
- `animate (object) (animation)`
- `teleport player to (location)`
- `set (variable) to (value)`
- `give/take item`
- `roll dice` / `check stat`

### 9.4 AI-Assisted Dream Creation

**Describe → Generate workflow:**

1. Creator describes the space in natural language:
   > "A cozy tavern with a fireplace, wooden tables, a bar counter, and stairs leading up to guest rooms"

2. AI suggests:
   - Tile layout
   - Object placement
   - Color palette
   - Basic scripts (fireplace crackles, bartender NPC)

3. Creator refines, adjusts, personalizes

**Script generation:**
1. Creator describes behavior:
   > "When someone sits at the bar, the bartender asks what they'd like to drink"

2. AI generates DreamScript:
   ```dreamscript
   when player enters "bar_stool_zone":
       npc "Bartender" says "What can I get ya?"
   ```

3. Creator reviews and tweaks

---

## 10. AI Integration

### 10.1 Design Philosophy

**AI assists, never replaces.**

- AI is a tool for enhancing creativity
- Always optional — can be disabled per-shard or per-user
- Transparent — users know when AI is involved
- Private — local models supported for privacy

### 10.2 Core AI Feature: Action-to-Art

**The signature feature of DreamLoom.**

**Flow:**
1. Player writes a roleplay action:
   > *Lyra draws her silver blade, moonlight glinting off the edge as she faces the shadowy figure in the doorway.*

2. Player clicks "Visualize" (or hotkey)

3. AI generates an image based on:
   - The text description
   - Avatar appearance (portrait as style reference)
   - Current dream setting
   - Any custom style settings

4. Image appears in chat (or a gallery panel)
   - Visible to all present (or just the player, configurable)
   - Can be saved to a session gallery
   - Optional: saved to character's art collection

**Technical considerations:**
- Generation should be fast (<10 seconds ideally)
- Queue system for high-traffic shards
- Quality/speed tradeoff options
- Rate limiting to prevent abuse/cost overruns

### 10.3 Other AI Features

**Scene Descriptions**
- GM clicks "Describe Scene"
- AI generates atmospheric text based on current dream
- GM can edit before posting

**NPC Dialogue**
- Simple NPCs can have AI-generated responses
- Creator sets personality, knowledge, constraints
- AI handles conversation within those bounds

**Dream Creation Assistance**
- Described in Section 9.4

**Script Generation**
- Described in Section 9.4

### 10.4 AI Backends

DreamLoom supports multiple AI backends:

| Backend | Use Case | Privacy |
|---------|----------|---------|
| **Local (Ollama/llama.cpp)** | Text generation, script help | Full privacy |
| **Local (Stable Diffusion)** | Image generation | Full privacy |
| **Cloud (OpenAI, Anthropic)** | Text generation | Data sent to provider |
| **Cloud (Replicate, etc.)** | Image generation | Data sent to provider |

Shard operators choose which backends to enable and configure.

### 10.5 AI Safety & Moderation

- Content filters configurable per-shard
- Generation prompts can be logged for moderation review
- Users can report inappropriate AI outputs
- Rate limiting and cost controls
- Clear ToS about AI-generated content ownership

---

## 11. Social Systems

### 11.1 Friends & Contacts

- Add friends (mutual confirmation)
- See online status (if they allow)
- Quick whisper / teleport-to options
- Notes on contacts (private)
- Block list (prevents all interaction)

### 11.2 Parties

Temporary groups for playing together:
- Invite players to party
- Shared party chat channel
- See party members on map (if in same dream)
- Quick teleport to party leader
- Disband when leader leaves (or transfer leadership)

### 11.3 Groups / Guilds

Persistent organizations:
- Created by players, shard-approved (optional)
- Member roles and permissions
- Group chat channel
- Shared dream ownership (optional)
- Group events calendar

### 11.4 Moderation Tools

**User-level:**
- Block (personal ignore)
- Report (sends to moderators)
- Leave dream / teleport away

**Dream-owner level:**
- Kick from dream
- Ban from dream (temporary or permanent)
- Set dream permissions (who can enter, speak, build)

**Shard-level (moderators/admins):**
- Warn / mute / kick / ban users
- Review reports
- Audit logs
- Content removal
- Shard-wide announcements

### 11.5 Privacy Controls

Users control:
- Who can see their online status
- Who can whisper them
- Who can teleport to them
- Profile visibility
- Character sheet visibility
- AI art generation (opt-in/out)

---

## 12. Technical Architecture

### 12.1 Overview

```
┌─────────────────────────────────────────────────────────┐
│                        CLIENTS                          │
│  ┌──────────┐  ┌──────────┐  ┌──────────┐              │
│  │  Godot   │  │   Web    │  │  Mobile  │              │
│  │ (Desktop)│  │(Browser) │  │ (Future) │              │
│  └────┬─────┘  └────┬─────┘  └────┬─────┘              │
│       └──────────────┼──────────────┘                   │
│                      │ WebSocket                        │
└──────────────────────┼──────────────────────────────────┘
                       │
┌──────────────────────┼──────────────────────────────────┐
│                      ▼           SHARD SERVER           │
│  ┌─────────────────────────────────────────────────┐   │
│  │              Game Server (Rust/Go)              │   │
│  │  ┌─────────┐ ┌─────────┐ ┌─────────┐           │   │
│  │  │ Auth &  │ │  World  │ │  Chat   │           │   │
│  │  │ Session │ │  State  │ │  System │           │   │
│  │  └─────────┘ └─────────┘ └─────────┘           │   │
│  │  ┌─────────┐ ┌─────────┐ ┌─────────┐           │   │
│  │  │  Dream  │ │  RPG    │ │   AI    │           │   │
│  │  │  Engine │ │ Mechanics│ │ Bridge  │           │   │
│  │  └─────────┘ └─────────┘ └─────────┘           │   │
│  └─────────────────────────────────────────────────┘   │
│       │              │              │                   │
│       ▼              ▼              ▼                   │
│  ┌─────────┐   ┌─────────┐   ┌─────────┐              │
│  │PostgreSQL│   │  Redis  │   │AI Backend│              │
│  │(Persist) │   │ (State) │   │(Local/   │              │
│  │          │   │         │   │ Cloud)   │              │
│  └─────────┘   └─────────┘   └─────────┘              │
└─────────────────────────────────────────────────────────┘
```

### 12.2 Client

**Primary: Godot 4.x**
- Open source engine
- Excellent 2D/isometric support
- Exports to Windows, Mac, Linux, Web
- GDScript or C# for game logic

**Secondary: Web Client**
- For zero-install access
- May be limited feature set initially
- WebSocket + Canvas/WebGL

### 12.3 Server

**Language: Rust or Go** (TBD, community input welcome)

Both offer:
- High performance
- Memory safety
- Excellent concurrency
- Good WebSocket libraries

**Architecture: Authoritative Server**
- Server is source of truth
- Client sends inputs, receives state updates
- Prevents most cheating
- Thin client approach

### 12.4 Database

**PostgreSQL** — Primary persistent storage
- User accounts
- Avatar data
- Dream definitions
- Character sheets
- Moderation logs

**Redis** — Real-time state
- Online users
- Current positions
- Session data
- Chat rate limiting
- AI queue

### 12.5 Protocol

**WebSocket-based** for real-time communication

**Message format:** JSON (human-readable) or MessagePack (efficient)

**Protocol versioned** to support multiple client versions

**Example messages:**
```json
// Client → Server: Move
{"type": "move", "to": {"x": 15, "y": 22}}

// Server → Client: Position update
{"type": "position", "avatar_id": "abc123", "pos": {"x": 15, "y": 22}}

// Client → Server: Chat
{"type": "chat", "channel": "say", "text": "Hello everyone!"}

// Server → Client: Chat broadcast
{"type": "chat", "from": "PlayerName", "channel": "say", "text": "Hello everyone!", "avatar_id": "abc123"}
```

### 12.6 Federation (Future)

Shards can optionally connect:
- Shared friend lists across shards
- Cross-shard whispers
- Dream discovery across federation
- Portable avatar identities (optional)

---

## 13. Art Direction

### 13.1 Visual Identity

**Keywords:** Cozy, warm, nostalgic, inviting, imaginative

**Not:** Hyper-realistic, grimdark, pixel-perfect retro, sterile

DreamLoom should feel like a place you want to spend time in — a digital hearth.

### 13.2 Isometric Specifications

**Perspective:** Standard isometric (2:1 ratio)
- Tiles are diamond-shaped when viewed
- 26.565° angle (arctan 0.5)

**Tile Size:** 64×32 pixels (base tile)
- Objects and avatars can exceed this
- Consistent grid for all dreams

**Scale:** 1 tile ≈ 1 meter (for reference, not strict)

### 13.3 Color Palette

**General guidance:**
- Warm, saturated colors for welcoming spaces
- Cooler tones for mysterious/magical areas
- Avoid harsh contrasts
- Support for dark mode UI

**UI Colors:**
- Background: Deep warm gray (#2A2420)
- Text: Warm white (#F5F0E8)
- Accent: Soft gold (#D4A574)
- Secondary: Muted teal (#6B9B9B)

### 13.4 Avatar Style

- Slightly stylized, not realistic
- Clear silhouettes (readable at small sizes)
- Expressive faces and poses
- Consistent proportions across species
- ~48-64 pixels tall on screen

### 13.5 Environment Style

- Hand-painted feel (not AI-generated for core assets)
- Layered depth (foreground/midground/background)
- Atmospheric effects (lighting, particles)
- Consistent perspective and scale

---

## 14. Audio Direction

### 14.1 Music

- Ambient, unobtrusive background tracks
- Dream-specific music (owner can set)
- Volume controls per-source
- Support for custom music (shard-uploaded)

### 14.2 Sound Effects

- UI sounds (subtle, satisfying)
- Footsteps (varies by surface)
- Environment ambience (wind, water, fire)
- Emote sounds (optional)
- Notification sounds

### 14.3 Voice Chat (Future)

- Proximity-based voice (hear nearby avatars)
- Party voice channel
- Push-to-talk or voice activation
- Moderation controls (mute, deafen)

---

## 15. Monetization Philosophy

### 15.1 Core Principle

**Community over commerce.**

DreamLoom will never have:
- Pay-to-win mechanics
- Lootboxes or gambling mechanics
- Paywalled gameplay features
- Aggressive advertising

### 15.2 Potential Revenue Streams

**For shard operators:**
- Hosting costs passed to community (donations, Patreon)
- Optional cosmetics (avatar items, dream decorations)
- Priority AI generation queue (if using cloud backends)

**For the core project:**
- Donations to development fund
- Optional hosted shard service (we run it for you)
- Support contracts for large deployments
- Merchandise (if the community wants it)

### 15.3 Open Source Sustainability

The codebase is AGPL-3.0 — it stays open forever.

Sustainability comes from:
- Community contributions
- Grant funding (open source foundations)
- Optional paid services around the free core

---

## 16. Accessibility

### 16.1 Commitment

DreamLoom should be playable by everyone possible.

### 16.2 Features

**Visual:**
- UI scaling
- High contrast mode
- Colorblind-friendly palettes
- Screen reader support for chat and menus

**Motor:**
- Full keyboard navigation
- Rebindable keys
- Click-to-move (no precise inputs required)
- Adjustable double-click timing

**Cognitive:**
- Clean, uncluttered UI
- Dyslexia-friendly font options
- Adjustable text speed
- Tutorial and help system

**Audio:**
- Visual indicators for sound cues
- Closed captions for any voice content
- Music/SFX/Voice separate volume controls

### 16.3 Low System Requirements

Target minimum specs:
- 4GB RAM
- Integrated graphics (Intel HD 4000+)
- Any dual-core CPU from 2012+
- 100MB storage for client
- Stable internet connection (low bandwidth okay)

---

## 17. Future Considerations

### 17.1 Mobile Client

- Touch-optimized interface
- Same server, different client
- May have reduced features initially

### 17.2 VR/AR Mode

- Explore dreams in VR
- 3D representation of isometric spaces
- Voice + gesture interaction
- Social presence features

### 17.3 Animation Generation

- AI-generated animations from action descriptions
- Per-action sprite generation
- Computationally expensive — future tech

### 17.4 Marketplace

- Share dreams publicly
- Share avatar assets
- Tip creators
- Curated collections

### 17.5 API for External Tools

- Bots and integrations
- External dream editors
- Data export/import
- Third-party clients

---

## Appendix A: Inspirations

| Project | What We Take |
|---------|--------------|
| **Furcadia** | Dreams, cozy isometric, community focus |
| **Roll20** | Character sheets, dice, GM tools |
| **Second Life** | User creation at scale |
| **MUCKs/MUDs** | Text-first interaction, imagination |
| **Minecraft** | Player creativity as the game |
| **AI Art Tools** | Action-to-image generation |

---

## Appendix B: Glossary

| Term | Definition |
|------|------------|
| **Avatar** | A player's visual representation in the world |
| **Dream** | A user-created space/area |
| **Shard** | A server instance, self-contained community |
| **GM** | Game Master — runs structured roleplay sessions |
| **DreamScript** | The scripting language for dream interactivity |
| **Tile** | The basic unit of world space (64×32 pixels) |
| **Portrait** | Larger avatar image for profiles and AI reference |

---

## Appendix C: Document History

| Version | Date | Changes |
|---------|------|---------|
| 0.1 | Dec 2024 | Initial foundation draft |

---

*This is a living document. It will evolve as the project develops and the community provides input.*

*Dream big. Weave together. Stay cozy.* 🌙
