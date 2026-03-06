#!/usr/bin/env bash
# scripts/setup.sh — One-command Claude Code local setup
# Usage: bash scripts/setup.sh

set -euo pipefail

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "  Claude Code — Setup Script"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

# 1. Check OS
OS="$(uname -s)"
echo "→ Detected OS: $OS"

# 2. Check Git
if ! command -v git &>/dev/null; then
  echo -e "${RED}✗ Git not found. Please install Git first.${NC}"
  echo "  macOS: brew install git"
  echo "  Linux: sudo apt install git"
  exit 1
fi
echo -e "${GREEN}✓ Git found: $(git --version)${NC}"

# 3. Check if Claude Code already installed
if command -v claude &>/dev/null; then
  echo -e "${GREEN}✓ Claude Code already installed: $(claude --version)${NC}"
else
  echo -e "${YELLOW}→ Claude Code not found. Installing via native installer...${NC}"
  curl -fsSL https://claude.ai/install.sh | bash
  # Reload PATH
  export PATH="$HOME/.claude/local/bin:$PATH"
  if command -v claude &>/dev/null; then
    echo -e "${GREEN}✓ Claude Code installed successfully!${NC}"
  else
    echo -e "${RED}✗ Installation may have succeeded but 'claude' not yet in PATH.${NC}"
    echo "  Run: source ~/.bashrc  OR  source ~/.zshrc"
    echo "  Then re-run this script."
    exit 1
  fi
fi

# 4. Run diagnostics
echo ""
echo "→ Running claude doctor..."
claude doctor || true

# 5. Done
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "${GREEN}  Setup complete!${NC}"
echo ""
echo "  Next steps:"
echo "  1. Run: claude"
echo "  2. Inside session, run: /init"
echo "  3. See INSTALL.md for VS Code / Cursor integration"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
