# Claude Code — Installation & Setup Guide

> Install Claude Code locally and integrate it with your terminal, VS Code, and Cursor IDE.

---

## Table of Contents

- [Prerequisites](#prerequisites)
- [Installation](#installation)
  - [Method 1: Native Installer (Recommended)](#method-1-native-installer-recommended)
  - [Method 2: npm (Legacy / Deprecated)](#method-2-npm-legacy--deprecated)
  - [Windows Setup](#windows-setup)
- [Authentication](#authentication)
- [Terminal Integration](#terminal-integration)
- [VS Code Integration](#vs-code-integration)
- [Cursor IDE Integration](#cursor-ide-integration)
- [Modes & Navigation](#modes--navigation)
- [Slash Commands Reference](#slash-commands-reference)
- [Project Configuration](#project-configuration)
- [Troubleshooting](#troubleshooting)
- [Quick Reference](#quick-reference)

---

## Prerequisites

> **Note:** The native installer requires NO Node.js. Only the legacy npm method requires Node.js 18+.

### For the native installer (recommended)

| Requirement        | Details                                     |
|--------------------|---------------------------------------------|
| **OS (macOS)**     | 10.15 Catalina or later                     |
| **OS (Linux)**     | Ubuntu 20.04+, Debian 10+, or equivalent    |
| **OS (Windows)**   | Windows 10/11 with Git for Windows or WSL   |
| **Git**            | v2.30+ (required for most workflows)        |
| **Network**        | Internet connection required                |
| **Account**        | Claude Pro, Max, Teams, Enterprise, or Console (free plan does NOT include Claude Code) |

### For npm installation only (optional, deprecated)

| Requirement  | Minimum  |
|--------------|----------|
| **Node.js**  | v18.0+   |
| **npm**      | v9.0+    |

### Verify Git and Node.js (if using npm)

```bash
git --version     # Should be 2.30+
node --version    # Should be v18+ (npm method only)
npm --version     # Should be 9+ (npm method only)
```

### Install Node.js via nvm (only needed for npm method)

```bash
# Install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash

# Restart terminal, then:
nvm install 22
nvm use 22
```

---

## Installation

### Method 1: Native Installer (Recommended)

Self-contained, requires no Node.js, and auto-updates in the background on startup.

**macOS / Linux / WSL:**
```bash
curl -fsSL https://claude.ai/install.sh | bash
```

**Reload your shell config:**
```bash
source ~/.bashrc   # bash users
source ~/.zshrc    # zsh users
```

**Verify:**
```bash
claude --version
claude doctor      # Run diagnostics
```

**macOS — Homebrew alternative** *(requires manual updates — no auto-update)*:
```bash
brew install --cask claude-code
```

**Windows — WinGet** *(requires manual updates)*:
```powershell
winget install Anthropic.ClaudeCode
```

---

### Method 2: npm (Legacy / Deprecated)

> ⚠️ **npm installation is officially deprecated.** Use the native installer above.
> Only use this if you have a specific compatibility requirement.

```bash
npm install -g @anthropic-ai/claude-code
```

> **Do NOT use `sudo npm install -g`** — this causes permission issues and security risks.

**Fix npm permission errors:**
```bash
mkdir -p ~/.npm-global
npm config set prefix '~/.npm-global'
# Add to ~/.bashrc or ~/.zshrc:
export PATH="$HOME/.npm-global/bin:$PATH"
```

**Migrate from npm to native installer:**
```bash
curl -fsSL https://claude.ai/install.sh | bash   # Install native binary
npm uninstall -g @anthropic-ai/claude-code        # Remove npm version
```
> Your config files (`~/.claude/settings.json`) and project settings (`.claude/`) are preserved during migration.

---

### Windows Setup

Claude Code runs on **PowerShell, CMD, and Git Bash**. Git for Windows is required.

**Option 1 — Native Windows with Git Bash (Recommended):**
1. Install [Git for Windows](https://git-scm.com/download/win)
2. Run from PowerShell or CMD:
   ```powershell
   winget install Anthropic.ClaudeCode
   ```
3. If Claude Code can't find Git Bash automatically, set the path in `~/.claude/settings.json`

**Option 2 — WSL (Both WSL 1 and WSL 2 supported):**
```powershell
# Run in PowerShell as Administrator
wsl --install
```
Then open your Linux terminal and install Claude Code inside WSL using the native installer.

> WSL 2 supports sandboxing for enhanced security. WSL 1 does not.

---

## Authentication

Run Claude Code for the first time — it will open a browser window for OAuth sign-in:

```bash
cd /your/project
claude
```

After login, credentials are stored securely in `~/.claude/`. You can also authenticate using `ANTHROPIC_API_KEY` as an environment variable for Console/API accounts:

```bash
export ANTHROPIC_API_KEY=sk-ant-...
# Add to ~/.bashrc or ~/.zshrc to make it persistent
```

> **Security:** Never write your API key as plain text in a shell profile that's version-controlled. Use a secrets manager or OS keychain for production environments.

---

## Terminal Integration

Always launch Claude Code from your **project root** so it can see your full workspace:

```bash
cd /path/to/your/project
claude
```

**Common launch flags:**
```bash
claude                                   # Start interactive session
claude --continue                        # Resume most recent session (no picker)
claude --resume                          # Resume a session (shows picker)
claude -p "your prompt here"            # One-shot print mode (no REPL)
claude --model claude-sonnet-4-6        # Use a specific model
claude --permission-mode plan           # Start directly in Plan Mode
claude --dangerously-skip-permissions   # Skip all permission prompts (use with caution)
```

**Multi-line prompts:**
Run `/terminal-setup` inside a session to configure Shift+Enter for multi-line input.

> As of recent versions, Shift+Enter works out of the box in iTerm2, WezTerm, Ghostty, and Kitty.

**Pipe content into Claude:**
```bash
npm audit --json | claude -p "Order these vulnerabilities by severity" > report.md
cat error.log | claude -p "Explain what's causing this error"
```

---

## VS Code Integration

### Install the Extension

**Option A — VS Code Marketplace:**
1. Press `Cmd+Shift+X` (Mac) / `Ctrl+Shift+X` (Windows/Linux)
2. Search **"Claude Code"**
3. Click **Install**

**Option B — Auto-install from integrated terminal:**
1. Open VS Code's integrated terminal (`` Ctrl+` ``)
2. Run: `claude`
3. Claude Code detects VS Code and prompts to install the extension automatically

**Option C — Add `code` CLI to PATH (fixes detection issues):**
- Open Command Palette (`Cmd+Shift+P` / `Ctrl+Shift+P`)
- Run: `Shell Command: Install 'code' command in PATH`

### Key Shortcuts

| Action                         | Mac              | Windows / Linux      |
|--------------------------------|------------------|----------------------|
| Open Claude panel              | Sidebar spark icon | Sidebar spark icon |
| New conversation               | `Cmd+N`          | `Ctrl+N`             |
| Toggle editor / Claude focus   | `Cmd+Esc`        | `Ctrl+Esc`           |
| Command palette                | `Cmd+Shift+P`    | `Ctrl+Shift+P`       |
| Extensions panel               | `Cmd+Shift+X`    | `Ctrl+Shift+X`       |
| Integrated terminal            | `` Cmd+` ``      | `` Ctrl+` ``         |
| Reference file (with line range) | `Option+K`    | `Alt+K`              |

### Key Features

- **Plan Mode** — Press `Shift+Tab` twice. Claude plans before touching files.
- **Auto-accept mode** — Claude edits without asking for confirmation each time.
- **@-mention files** — Type `@filename` to give Claude specific file context.
- **Checkpoints** — Hover over any message to rewind/undo changes.
- **Multiple conversations** — Open parallel Claude sessions in separate tabs.
- **`#` quick memory** — Type `# always use TypeScript strict mode` to instantly save to CLAUDE.md.
- **Permission mode indicator** — Click the mode label at the bottom of the prompt box.

### Connect external terminal to VS Code

If you started Claude in an external terminal, run inside the session:
```
/ide
```

---

## Cursor IDE Integration

> Claude Code doesn't auto-detect Cursor despite it being VS Code-based. Use one of the methods below.

### Step 1 — Install the extension manually

**Method A — Command Palette (easiest):**
1. Open Cursor → `Cmd+Shift+P` / `Ctrl+Shift+P`
2. Search: **"Extensions: Install from VSIX..."**
3. Locate the VSIX file:
   - **macOS/Linux:** `~/.claude/local/node_modules/@anthropic-ai/claude-code/vendor/claude-code.vsix`
   - **Windows:** `%USERPROFILE%\.claude\local\node_modules\@anthropic-ai\claude-code\vendor\claude-code.vsix`
4. Select and restart Cursor

**Method B — CLI:**
```bash
cursor --install-extension ~/.claude/local/node_modules/@anthropic-ai/claude-code/vendor/claude-code.vsix
```

**Method C — Drag and drop:**
Drag the `.vsix` file directly onto Cursor's Extensions panel.

### Step 2 — Add `cursor` CLI to PATH

In Cursor's Command Palette, run:
```
Shell Command: Install 'cursor' command in PATH
```
This lets Claude auto-detect Cursor for future sessions.

### Step 3 — Connect terminal to Cursor

```bash
# From Cursor's integrated terminal:
claude

# From an external terminal:
claude
# Then type: /ide
# Select "Cursor" from the picker
```

---

## Modes & Navigation

Claude Code has three modes. Cycle through them with **`Shift+Tab`**:

| Mode              | How to Activate       | Behavior                                                      |
|-------------------|-----------------------|---------------------------------------------------------------|
| **Default**       | `Shift+Tab` (cycle)   | Claude suggests changes and waits for your approval each time |
| **Auto-accept**   | `Shift+Tab` (cycle)   | Claude edits files without asking for confirmation            |
| **Plan Mode**     | `Shift+Tab` twice     | Claude plans only — no files touched until you approve        |

> **Best practice:** Always start complex or risky tasks in Plan Mode. Claude creates a `plan.md` file you can review and edit before it executes.

### Keyboard shortcuts inside a session

| Key / Command           | Action                                                    |
|-------------------------|-----------------------------------------------------------|
| `Escape`                | Stop Claude mid-response (don't use Ctrl+C!)              |
| `Escape` × 2            | Browse and jump to previous messages / rewind             |
| `Shift+Tab`             | Cycle through Default → Auto-accept → Plan modes          |
| `Ctrl+V`                | Paste image from clipboard (Cmd+V does NOT work)          |
| `Shift+drag` file       | Reference a file in Claude (plain drag opens it instead)  |
| `Tab`                   | Toggle extended thinking mode                             |
| `#` + text              | Instantly save a note to CLAUDE.md memory                 |
| `@filename`             | Reference a specific file in your prompt                  |
| `!command`              | Run a bash command directly from the prompt               |

---

## Slash Commands Reference

### Session management

| Command           | Description                                         |
|-------------------|-----------------------------------------------------|
| `/clear`          | Clear conversation and start fresh                  |
| `/compact`        | Compress context to free up context window          |
| `/context`        | View current context window usage                   |
| `/cost`           | Show token usage and estimated cost                 |
| `/quit` or `/exit`| Exit Claude Code                                    |

### Configuration & memory

| Command           | Description                                         |
|-------------------|-----------------------------------------------------|
| `/init`           | Generate a CLAUDE.md file for the current project   |
| `/memory`         | Open and edit your CLAUDE.md memory files           |
| `/config`         | Open the full settings interface                    |
| `/model`          | Switch between Claude models (Sonnet, Haiku, Opus)  |
| `/permissions`    | View and update tool permissions                    |

### Tools & integration

| Command              | Description                                      |
|----------------------|--------------------------------------------------|
| `/ide`               | Connect Claude to the current IDE                |
| `/terminal-setup`    | Configure Shift+Enter for multi-line prompts     |
| `/mcp`               | Manage MCP server connections                    |
| `/install-github-app`| Enable automatic PR reviews                     |
| `/plan`              | Enter Plan Mode (v2.1.0+)                        |

### Other

| Command           | Description                                         |
|-------------------|-----------------------------------------------------|
| `/help`           | Show all available commands                         |
| `/vim`            | Enable Vim editing mode                             |
| `/bug`            | Report a bug directly from within Claude Code       |
| `/review`         | Trigger a code review                               |
| `/rewind`         | Undo the last action / roll back changes            |

---

## Project Configuration

### CLAUDE.md — Project memory file

CLAUDE.md is automatically loaded by Claude at the start of every session. Use it to document your project architecture, coding standards, and common commands so Claude always has context.

**Generate one automatically:**
```bash
cd /your/project
claude
# Then run:
/init
```

**CLAUDE.md hierarchy:**
- `~/.claude/CLAUDE.md` — Global, applies to all projects
- `<project-root>/CLAUDE.md` — Project-level (commit to git for team sharing)
- `<subdir>/CLAUDE.md` — Subdirectory-specific rules (e.g., `/frontend/CLAUDE.md`)

> **Keep CLAUDE.md under 200 lines.** Longer files burn context tokens. Link to separate doc files for detailed specs.

**Add memory quickly during a session:**
```
# always use React Query for server state
# prefer composition over inheritance
```
These are saved instantly to the most relevant CLAUDE.md file.

---

### .claudeignore — Exclude files from context

Create `.claudeignore` in your project root to prevent Claude from processing irrelevant files:

```
# Dependencies
node_modules/
.pnp

# Build outputs
dist/
build/
.next/
out/

# Environment & secrets — IMPORTANT for security
.env
.env.local
.env.*.local
*.pem

# Lock files
package-lock.json
yarn.lock
pnpm-lock.yaml

# Logs
*.log

# IDE / OS
.DS_Store
.idea/
```

---

### settings.json — Behaviour configuration

Claude Code uses `.claude/settings.json` (project) and `~/.claude/settings.json` (user) for permissions, hooks, and model settings.

**Settings precedence** (top = highest priority):
1. Managed/enterprise policies
2. `.claude/settings.json` — project-level, commit to git
3. `.claude/settings.local.json` — local overrides, git-ignored
4. `~/.claude/settings.json` — user-level

**Example — allow specific bash commands:**
```json
{
  "permissions": {
    "allow": ["Bash(npm run *)", "Bash(git *)"],
    "deny": ["Bash(rm -rf *)"]
  },
  "model": "claude-sonnet-4-6"
}
```

**Example — auto-run Prettier after edits:**
```json
{
  "hooks": [
    {
      "matcher": "Edit|Write",
      "hooks": [
        {
          "type": "command",
          "command": "prettier --write \"$CLAUDE_FILE_PATHS\""
        }
      ]
    }
  ]
}
```

---

## Troubleshooting

### Run diagnostics first
```bash
claude doctor
```

### Common issues

| Problem                                     | Fix                                                                              |
|---------------------------------------------|----------------------------------------------------------------------------------|
| `command not found: claude`                 | Run `source ~/.bashrc` (or `~/.zshrc`), or open a new terminal                  |
| `EACCES: permission denied` (npm)           | `mkdir ~/.npm-global && npm config set prefix '~/.npm-global'`                  |
| Extension not auto-installed in VS Code     | Run `Shell Command: Install 'code' command in PATH` via Command Palette          |
| Cursor not detected                         | Use manual VSIX install (see Cursor section)                                     |
| Claude can't see project files              | Ensure `claude` was launched from the **project root**                           |
| WSL: `claude` not found                     | Install Claude Code **inside WSL**, not on the Windows side                      |
| `segmentation fault` on startup             | Mixed install — uninstall npm version, reinstall native binary                   |
| Extension on wrong VS Code profile          | Check active profile; reinstall on correct one                                   |
| Context fills up quickly on large repos     | Create `.claudeignore` to exclude `node_modules`, build dirs, lock files         |
| Rate limit slowness                         | Check plan tier limits at docs.anthropic.com/en/docs/rate-limits                 |

### Reset configuration (last resort)
```bash
# macOS/Linux
rm -rf ~/.claude ~/.claude.json

# Windows (PowerShell)
Remove-Item -Path "$env:USERPROFILE\.claude" -Recurse -Force
Remove-Item -Path "$env:USERPROFILE\.claude.json" -Force
```

---

## Quick Reference

| Task                               | Command / Action                                              |
|------------------------------------|---------------------------------------------------------------|
| Install (native, recommended)      | `curl -fsSL https://claude.ai/install.sh \| bash`            |
| Install (macOS Homebrew)           | `brew install --cask claude-code`                            |
| Install (Windows WinGet)           | `winget install Anthropic.ClaudeCode`                        |
| Verify install                     | `claude --version`                                           |
| Diagnose issues                    | `claude doctor`                                              |
| Start in project                   | `cd /your/project && claude`                                 |
| Resume last session (no picker)    | `claude --continue`                                          |
| Resume with picker                 | `claude --resume`                                            |
| Start in Plan Mode                 | `claude --permission-mode plan`                              |
| One-shot query                     | `claude -p "your question"`                                  |
| Generate CLAUDE.md                 | Run `/init` inside a session                                 |
| Cycle modes                        | `Shift+Tab`                                                  |
| Enter Plan Mode (in session)       | `Shift+Tab` twice, or `/plan`                               |
| Install VS Code extension          | `Cmd+Shift+X` → search "Claude Code"                        |
| Install Cursor extension (manual)  | VSIX from `~/.claude/local/.../vendor/claude-code.vsix`     |
| Connect terminal to IDE            | `/ide` inside a session                                      |
| Auto-updates                       | Native binary updates automatically on startup               |
| Report a bug                       | `/bug` inside a session                                      |

---

> **Official docs:** https://docs.claude.com/en/docs/claude-code/overview
> **Settings reference:** https://code.claude.com/docs/en/settings
> **Support:** https://support.claude.com
