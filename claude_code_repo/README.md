<div align="center">

# ⚡ Claude Code Activities

> A curated, production-standard log of real-world Claude Code usage —
> setups, workflows, experiments, and lessons learned.

[![GitHub Stars](https://img.shields.io/github/stars/Karthikeyanmuthu25/Claude_code?style=flat-square&color=yellow)](https://github.com/Karthikeyanmuthu25/Claude_code/stargazers)
[![GitHub Forks](https://img.shields.io/github/forks/Karthikeyanmuthu25/Claude_code?style=flat-square&color=blue)](https://github.com/Karthikeyanmuthu25/Claude_code/network)
[![Last Commit](https://img.shields.io/github/last-commit/Karthikeyanmuthu25/Claude_code?style=flat-square)](https://github.com/Karthikeyanmuthu25/Claude_code/commits/main)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg?style=flat-square)](./LICENSE)

</div>

---

## 📌 What is this repo?

This repository tracks my hands-on journey with **Claude Code** — Anthropic's AI-powered
agentic coding tool. It includes:

- ✅ Installation & environment setup guides
- 🔧 Real project integrations (VS Code, Cursor, Terminal)
- 📋 CLAUDE.md templates and configuration patterns
- 🧪 Experiments, prompts, and workflow discoveries
- 📝 Daily/weekly activity logs
- 💡 Tips, gotchas, and lessons learned

---

## 🗂️ Repository Structure

```
Claude_code/
│
├── 📄 README.md                    ← You are here
├── 📄 CLAUDE.md                    ← Project context loaded by Claude Code
├── 📄 INSTALL.md                   ← Full installation & IDE setup guide
├── 📄 CHANGELOG.md                 ← Version history of this repo
├── 📄 CONTRIBUTING.md              ← How to contribute
├── 📄 LICENSE                      ← MIT License
│
├── 📁 .github/
│   ├── workflows/
│   │   └── ci.yml                  ← GitHub Actions (lint & validate)
│   ├── ISSUE_TEMPLATE/
│   │   ├── bug_report.md
│   │   └── feature_request.md
│   └── PULL_REQUEST_TEMPLATE.md
│
├── 📁 docs/
│   ├── setup/
│   │   ├── macos.md                ← macOS-specific setup notes
│   │   ├── windows.md              ← Windows/WSL setup notes
│   │   └── linux.md                ← Linux setup notes
│   ├── integrations/
│   │   ├── vscode.md               ← VS Code integration guide
│   │   ├── cursor.md               ← Cursor IDE integration guide
│   │   └── terminal.md             ← Terminal workflows
│   └── reference/
│       ├── slash-commands.md       ← All slash commands reference
│       ├── settings.md             ← settings.json reference
│       └── claudeignore.md         ← .claudeignore patterns
│
├── 📁 projects/
│   └── README.md                   ← Index of Claude Code project experiments
│
├── 📁 logs/
│   └── README.md                   ← Activity log index & template
│
├── 📁 scripts/
│   ├── setup.sh                    ← One-command local setup script
│   └── validate.sh                 ← Validate CLAUDE.md & config files
│
└── 📁 resources/
    ├── claudeignore.template        ← Copy-paste .claudeignore template
    ├── settings.template.json       ← Copy-paste settings.json template
    └── CLAUDE.md.template           ← Copy-paste CLAUDE.md template
```

---

## 🚀 Quick Start

```bash
# 1. Clone the repo
git clone https://github.com/Karthikeyanmuthu25/Claude_code.git
cd Claude_code

# 2. Install Claude Code
curl -fsSL https://claude.ai/install.sh | bash

# 3. Verify
claude --version
claude doctor

# 4. Launch in this project
claude
```

→ Full setup guide: **[INSTALL.md](./INSTALL.md)**

---

## 📅 Activity Log

Recent activities tracked in [`/logs`](./logs/):

| Date       | Activity                          | Status  |
|------------|-----------------------------------|---------|
| 2026-03-06 | Repo initialized                  | ✅ Done |
| 2026-03-06 | INSTALL.md & CLAUDE.md created    | ✅ Done |
| —          | VS Code integration tested        | 🔄 In progress |
| —          | Cursor IDE VSIX setup             | 📋 Planned |
| —          | First project experiment          | 📋 Planned |

→ Add new entries in [`/logs`](./logs/) following the log template.

---

## 📚 Key Docs

| Document | Description |
|----------|-------------|
| [INSTALL.md](./INSTALL.md) | Complete Claude Code installation guide |
| [CLAUDE.md](./CLAUDE.md) | Project context template for Claude |
| [docs/integrations/vscode.md](./docs/integrations/vscode.md) | VS Code integration |
| [docs/integrations/cursor.md](./docs/integrations/cursor.md) | Cursor IDE integration |
| [docs/reference/slash-commands.md](./docs/reference/slash-commands.md) | All slash commands |
| [CHANGELOG.md](./CHANGELOG.md) | What's changed and when |

---

## 🤝 Contributing

Spotted something wrong or want to add your own Claude Code discoveries?
See [CONTRIBUTING.md](./CONTRIBUTING.md) or open an [Issue](https://github.com/Karthikeyanmuthu25/Claude_code/issues).

---

## 📄 License

[MIT](./LICENSE) — feel free to use, fork, and adapt.

---

<div align="center">
  <sub>Built by <a href="https://github.com/Karthikeyanmuthu25">Karthikeyanmuthu25</a> · Powered by <a href="https://claude.ai">Claude Code</a></sub>
</div>
