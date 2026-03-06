#!/usr/bin/env bash
# scripts/validate.sh — Validate repo structure and CLAUDE.md health
# Usage: bash scripts/validate.sh

set -euo pipefail

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

ERRORS=0

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "  Claude Code Repo — Validator"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

# 1. Required files
echo "Checking required files..."
REQUIRED=("README.md" "CLAUDE.md" "INSTALL.md" "CHANGELOG.md" "CONTRIBUTING.md" "LICENSE" ".gitignore")
for f in "${REQUIRED[@]}"; do
  if [ -f "$f" ]; then
    echo -e "  ${GREEN}✓ $f${NC}"
  else
    echo -e "  ${RED}✗ Missing: $f${NC}"
    ERRORS=$((ERRORS + 1))
  fi
done

# 2. CLAUDE.md line count
echo ""
echo "Checking CLAUDE.md size..."
if [ -f "CLAUDE.md" ]; then
  LINES=$(wc -l < CLAUDE.md)
  if [ "$LINES" -gt 200 ]; then
    echo -e "  ${RED}✗ CLAUDE.md has $LINES lines (max: 200). Trim it to save context tokens.${NC}"
    ERRORS=$((ERRORS + 1))
  else
    echo -e "  ${GREEN}✓ CLAUDE.md: $LINES lines (within 200-line limit)${NC}"
  fi
fi

# 3. Check for secrets
echo ""
echo "Scanning for secrets..."
SECRET_PATTERNS="sk-ant-|ANTHROPIC_API_KEY\s*=\s*sk|password\s*=\s*['\"][^'\"]\{8,\}"
if grep -rE "$SECRET_PATTERNS" --include="*.md" --include="*.json" --include="*.sh" . 2>/dev/null | grep -v ".gitignore"; then
  echo -e "  ${RED}✗ Potential secret detected in tracked files!${NC}"
  ERRORS=$((ERRORS + 1))
else
  echo -e "  ${GREEN}✓ No secrets detected${NC}"
fi

# 4. Check .gitignore covers .env
echo ""
echo "Checking .gitignore..."
if grep -q "\.env" .gitignore 2>/dev/null; then
  echo -e "  ${GREEN}✓ .env is in .gitignore${NC}"
else
  echo -e "  ${YELLOW}⚠  .env not found in .gitignore — add it!${NC}"
  ERRORS=$((ERRORS + 1))
fi

# 5. Result
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
if [ "$ERRORS" -eq 0 ]; then
  echo -e "${GREEN}  ✓ All checks passed!${NC}"
else
  echo -e "${RED}  ✗ $ERRORS check(s) failed. Fix before committing.${NC}"
  exit 1
fi
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
