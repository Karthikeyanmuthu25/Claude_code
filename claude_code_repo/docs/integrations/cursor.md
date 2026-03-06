# Cursor IDE Integration

Cursor is VS Code-based but Claude Code does **not** auto-detect it. Manual VSIX install required.

For full steps, see [INSTALL.md — Cursor section](../../INSTALL.md#cursor-ide-integration).

---

## VSIX File Location

After installing Claude Code natively:

```
# macOS/Linux
~/.claude/local/node_modules/@anthropic-ai/claude-code/vendor/claude-code.vsix

# Windows
%USERPROFILE%\.claude\local\node_modules\@anthropic-ai\claude-code\vendor\claude-code.vsix
```

---

## Install Methods (pick one)

**A — Command Palette:**
`Cmd+Shift+P` → "Extensions: Install from VSIX..." → select the file above

**B — CLI:**
```bash
cursor --install-extension ~/.claude/local/node_modules/@anthropic-ai/claude-code/vendor/claude-code.vsix
```

**C — Drag and drop:**
Drag the `.vsix` file onto Cursor's Extensions panel.

---

## After Install

1. Add `cursor` to PATH via Command Palette: `Install 'cursor' command in PATH`
2. Open Cursor's integrated terminal and run: `claude`
3. Or from external terminal: `claude` then `/ide` → select Cursor

---

## Notes

- Re-install the VSIX after every major Claude Code update
- All VS Code shortcuts apply in Cursor (`Shift+Tab` for modes, `@filename`, etc.)
