# Terminal Workflows

Tips and patterns for using Claude Code effectively from the terminal.

---

## Launch Patterns

```bash
# Standard — always from project root
cd /your/project && claude

# Resume without picker (most recent session)
claude --continue

# Resume with session picker
claude --resume

# One-shot (no REPL, returns immediately)
claude -p "Explain this error: $(cat error.log)"

# Start directly in Plan Mode
claude --permission-mode plan

# Use a specific model
claude --model claude-sonnet-4-6
```

---

## Piping & Scripting

```bash
# Pipe command output into Claude
npm audit --json | claude -p "Summarise vulnerabilities by severity"

# Pipe file contents
cat src/api/users.ts | claude -p "Write unit tests for this"

# Save Claude's output to a file
claude -p "Write a .gitignore for a Node.js project" > .gitignore
```

---

## Multi-line Prompts

Run `/terminal-setup` inside a session to configure `Shift+Enter` for multi-line input.

Terminals with native support (no setup needed): iTerm2, WezTerm, Ghostty, Kitty.

---

## Session Tips

- Always launch from **project root** — Claude maps your workspace from the launch directory
- Use `Escape` to stop Claude mid-response (not `Ctrl+C` — that kills the session)
- Use `/compact` when your context window fills up on long sessions
- Use `#note` shorthand mid-session to save anything important to CLAUDE.md instantly
