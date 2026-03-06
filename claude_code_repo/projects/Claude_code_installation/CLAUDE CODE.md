# Project Context

> This file is automatically loaded by Claude Code at the start of every session.
> Keep it under 200 lines. Link to external docs for detailed specs.
> Run `/init` inside a Claude Code session to auto-generate this from your project.

---

## Project Overview

<!-- Describe what this project is and does in 2-3 sentences -->
- **Name:** [Project Name]
- **Type:** [Web app / API / CLI / Library / Monorepo]
- **Stack:** [e.g., React + TypeScript + Node.js + PostgreSQL]
- **Purpose:** [Brief description]

---

## Architecture

<!-- Describe the high-level folder structure and key modules -->

```
/
├── src/              # Frontend source (React)
├── server/           # Backend API (Node.js / Express)
├── packages/         # Shared libraries (monorepo)
├── prisma/           # Database schema and migrations
├── tests/            # Test suites
└── docs/             # Documentation
```

Key architectural decisions:
- [e.g., Monorepo managed with Turborepo]
- [e.g., API follows REST conventions, versioned at /api/v1]
- [e.g., State managed via Zustand, server state via React Query]

---

## Code Standards

<!-- Claude will apply these to all code it writes or modifies -->

- Language: TypeScript with strict mode enabled (`"strict": true`)
- Linting: ESLint + Prettier enforced (pre-commit hooks via Husky)
- No default exports — use named exports everywhere
- Prefer `async/await` over `.then()` chains
- All public functions and APIs require JSDoc comments
- Tests are required for all new features and bug fixes

---

## Common Commands

<!-- These are the commands Claude needs to build, test, and lint your project -->

```bash
npm run dev          # Start development servers
npm run build        # Production build
npm test             # Run all tests
npm run test:watch   # Tests in watch mode
npm run lint         # Check linting
npm run lint:fix     # Auto-fix lint issues
npm run typecheck    # TypeScript type checking
npm run db:migrate   # Run database migrations
npm run db:seed      # Seed database with sample data
```

---

## Patterns & Conventions

### API Endpoints
- Create routes in `server/src/routes/`
- Use Zod for request/response validation
- All endpoints require OpenAPI/JSDoc documentation
- Return consistent error shapes: `{ error: string, code: string }`

### React Components
- Create in `src/components/`
- Use React Query for all server state
- Prefer composition over inheritance
- Co-locate tests with components (`ComponentName.test.tsx`)

### Database
- Prisma schema lives in `prisma/schema.prisma`
- Never write raw SQL — use Prisma client
- All migrations must be reviewed before merging

---

## Environment & Configuration

- Environment variables are in `.env` (local, git-ignored) and `.env.example` (committed)
- Never hardcode secrets, API keys, or credentials
- See `docs/environment.md` for full variable reference

---

## What to Avoid

<!-- Explicit guardrails for Claude -->

- Do NOT use `any` type in TypeScript
- Do NOT commit `.env` files
- Do NOT use `console.log` in production code — use the `logger` utility
- Do NOT bypass ESLint rules with `eslint-disable` without a comment explaining why
- Do NOT modify `prisma/schema.prisma` without creating a migration

---

## Useful References

<!-- Link to docs instead of inlining large specs -->

- Architecture decisions: `docs/architecture.md`
- API specification: `docs/api.md`
- Deployment guide: `docs/deployment.md`
- Contributing guide: `CONTRIBUTING.md`
