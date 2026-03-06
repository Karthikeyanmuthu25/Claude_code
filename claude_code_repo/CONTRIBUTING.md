# Contributing

Thanks for your interest in contributing to this Claude Code activities repo!

---

## Ways to Contribute

- **Fix inaccuracies** — Claude Code docs change fast; corrections are very welcome
- **Add setup notes** — OS-specific quirks, IDE edge cases, WSL gotchas
- **Share experiments** — Add a folder under `/projects/` with your findings
- **Improve templates** — Better `.claudeignore` patterns, `settings.json` examples
- **Log an activity** — Add a log entry under `/logs/`

---

## Process

1. Fork the repository
2. Create a branch: `git checkout -b fix/your-description`
3. Make your changes
4. Run the validation script: `bash scripts/validate.sh`
5. Commit using [Conventional Commits](https://www.conventionalcommits.org/):
   - `docs: fix typo in INSTALL.md`
   - `feat: add JetBrains IDE integration notes`
   - `fix: correct Node.js version requirement`
6. Open a Pull Request using the PR template

---

## Standards

- All markdown must be valid and render correctly on GitHub
- Keep CLAUDE.md under 200 lines
- No secrets, API keys, or credentials in any file — ever
- Link to official Anthropic docs when citing Claude Code behaviour

---

## Questions?

Open an [Issue](https://github.com/Karthikeyanmuthu25/Claude_code/issues) with the `question` label.
