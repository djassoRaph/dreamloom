# Contributing to DreamLoom

First off, thank you for considering contributing to DreamLoom! 🌙

This project is community-driven from day one. Whether you're a developer, artist, writer, designer, or just someone who loved Furcadia and wants to see something like it thrive again — there's a place for you here.

## Table of Contents

- [Code of Conduct](#code-of-conduct)
- [How Can I Contribute?](#how-can-i-contribute)
- [Getting Started](#getting-started)
- [Development Process](#development-process)
- [Style Guidelines](#style-guidelines)
- [Community](#community)

---

## Code of Conduct

DreamLoom is meant to be a welcoming, cozy space — both the game and the community building it.

**Be kind. Be respectful. Assume good intent.**

We do not tolerate harassment, discrimination, or toxicity of any kind. This applies to:
- GitHub issues, PRs, and discussions
- Discord and other community spaces
- In-game behavior on official shards

Violators will be warned, then removed if behavior continues.

---

## How Can I Contribute?

### 🐛 Reporting Bugs

Found something broken? Open an issue with:
- A clear, descriptive title
- Steps to reproduce the bug
- What you expected to happen
- What actually happened
- Screenshots or logs if applicable
- Your environment (OS, client version, etc.)

### 💡 Suggesting Features

Have an idea? We'd love to hear it! Open an issue with:
- A clear description of the feature
- Why it would benefit the project
- Any implementation ideas (optional)
- Reference to similar features in other projects (optional)

Use the `[Feature]` prefix in your issue title.

### 🎨 Contributing Art

We need:
- Tile sets (isometric, cozy aesthetic)
- Avatar sprites and customization pieces
- UI elements and icons
- Concept art
- Promotional art

**Art contributions should be:**
- Original work or properly licensed
- Willing to be released under CC-BY-SA 4.0 (or compatible)
- Consistent with the project's cozy, nostalgic aesthetic

Open an issue or PR with your work, or share in our Discord art channel.

### 💻 Contributing Code

Ready to code? Here's how:

1. **Find an issue** — Look for issues tagged `good first issue` or `help wanted`
2. **Comment on it** — Let us know you're working on it
3. **Fork the repo** — Create your own copy
4. **Create a branch** — `feature/your-feature-name` or `fix/bug-description`
5. **Make your changes** — Write clean, documented code
6. **Test your changes** — Make sure nothing breaks
7. **Submit a PR** — Reference the issue, explain your changes

### 📝 Contributing Documentation

Good docs are crucial. You can help by:
- Fixing typos or unclear explanations
- Writing tutorials
- Improving code comments
- Translating documentation
- Writing lore and world-building content

### 🧪 Testing

Once we have builds:
- Play the game and report bugs
- Test on different platforms/hardware
- Try to break things creatively
- Provide feedback on UX and gameplay

---

## Getting Started

### Prerequisites

*To be updated as we finalize the tech stack*

**Client Development:**
- Godot 4.x
- Git

**Server Development:**
- Rust or Go (TBD)
- PostgreSQL
- Redis
- Docker (recommended)

### Setting Up Your Environment

```bash
# Clone your fork
git clone https://github.com/YOUR-USERNAME/dreamloom.git
cd dreamloom

# Add upstream remote
git remote add upstream https://github.com/ORIGINAL-ORG/dreamloom.git

# Create a branch for your work
git checkout -b feature/your-feature-name
```

### Running Locally

*Instructions coming soon as we build out the initial prototype*

---

## Development Process

### Branching Strategy

- `main` — Stable, release-ready code
- `develop` — Integration branch for features
- `feature/*` — New features
- `fix/*` — Bug fixes
- `docs/*` — Documentation changes

### Pull Request Process

1. Update documentation if needed
2. Add tests if applicable
3. Ensure all tests pass
4. Request review from maintainers
5. Address feedback
6. Squash commits if requested
7. Maintainer merges when approved

### Commit Messages

Use clear, descriptive commit messages:

```
type: short description

Longer explanation if needed. Wrap at 72 characters.

Fixes #123
```

Types: `feat`, `fix`, `docs`, `style`, `refactor`, `test`, `chore`

---

## Style Guidelines

### Code Style

*To be detailed as we establish the codebase*

General principles:
- Write readable code over clever code
- Comment the "why", not the "what"
- Keep functions small and focused
- Use meaningful variable names

### Art Style

DreamLoom aims for a cozy, nostalgic aesthetic:
- Isometric perspective (standard 2:1 ratio)
- Warm, inviting color palettes
- Not hyper-realistic, not pixel-perfect retro — something in between
- Consistent tile sizes (TBD, likely 64x32 or 128x64)

See our art style guide (coming soon) for detailed specifications.

### Writing Style

For documentation:
- Clear and concise
- Friendly but professional
- Use examples where helpful
- Assume the reader is intelligent but unfamiliar

---

## Community

### Where to Find Us

- **GitHub Issues** — Bug reports, feature requests
- **GitHub Discussions** — General discussion, Q&A
- **Discord** — Real-time chat, art sharing, voice (link coming soon)

### Decision Making

Major decisions are made through:
1. Discussion in Issues or Discord
2. RFC (Request for Comments) for significant changes
3. Maintainer consensus
4. Community input welcomed throughout

### Recognition

All contributors will be recognized in:
- CONTRIBUTORS.md
- In-game credits (when applicable)
- Release notes for their contributions

---

## Questions?

Don't hesitate to ask! Open an issue with the `[Question]` prefix or reach out on Discord.

Welcome to DreamLoom. Let's build something magical together. 🌙
