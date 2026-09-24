# AGENTS.md - FlowSync

## Overview

Monorepo: `backend/` (AdonisJS 7, API) + `frontend/` (React 19 + Vite).
Auth via access tokens (`oat_` prefix). SQLite + Lucid ORM.

## Conventions

- **Migration-first**: NEVER edit the database schema by hand. Create a
  migration (`node ace make:migration`) and run `node ace migration:run`.
- **Transformers**: API output goes through a `*Transformer`
  (`toObject()` with `this.pick(...)`). Never serialize a Lucid model
  directly from a controller.
- **Validation**: VineJS validators live in `#validators/*`. No manual
  request validation inside controllers.
- **Controllers**: use the generated controller bindings
  (`#generated/controllers`).
- **Dates**: Luxon `DateTime`, not native `Date`.
- **Lint/format**: ESLint + Prettier. Backend already has Prettier;
  the frontend does not.

## Key commands

- `node ace migration:run` (from `backend/`) - apply migrations
- `npm run test` (from `backend/`) - backend test suite
- `npm run lint` (from `backend/`) - ESLint + Prettier
- `npm run dev` (from each folder) - start backend (port 3333) / frontend (port 5173)

## Gotchas

- Auth is token-based (`@adonisjs/auth` access tokens), not session-based.
  The profile endpoint requires an `Authorization: Bearer oat_...` header.
- The profile is served through `UserTransformer`; never expose the
  password hash.
- Do not add new dependencies without justifying them.
- Backend routes are prefixed with `/api/v1` (see `backend/start/routes.ts`).
