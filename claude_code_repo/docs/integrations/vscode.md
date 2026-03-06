# VS Code Integration

Full reference for using Claude Code with Visual Studio Code.

For installation, see [INSTALL.md — VS Code section](../../INSTALL.md#vs-code-integration).

---

## Quick Setup

1. Install Claude Code: `curl -fsSL https://claude.ai/install.sh | bash`
2. Open VS Code's integrated terminal
3. Run: `claude`
4. Claude detects VS Code and offers to install the extension automatically
5. Accept — restart VS Code when prompted

---

## Shortcuts

| Action | Mac | Windows/Linux |
|--------|-----|---------------|
| Open Claude panel | Sidebar spark icon | Sidebar spark icon |
| New conversation | `Cmd+N` | `Ctrl+N` |
| Toggle focus | `Cmd+Esc` | `Ctrl+Esc` |
| Reference file | `Option+K` | `Alt+K` |
| Cycle modes | `Shift+Tab` | `Shift+Tab` |

---

## Features

- **Plan Mode** — `Shift+Tab` twice before Claude touches any files
- **Auto-accept** — `Shift+Tab` once for hands-free editing
- **@-mention** — `@filename` to pin a file into context
- **Checkpoints** — hover any message to rewind or undo
- **`#` quick memory** — saves notes directly to CLAUDE.md mid-session

---

## Troubleshooting

- Extension not detected → Run `Shell Command: Install 'code' command in PATH`
- Wrong profile → Check VS Code's active profile and reinstall there
