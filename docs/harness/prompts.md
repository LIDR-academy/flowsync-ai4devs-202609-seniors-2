# Prompts

## Ticket

```markdown
# New users can sign up, log in, and see their space

As a first-time user of FlowSync, I want to create an account, log in, and land in my space where I can see who I am, so I can start using the product without anyone's help.

**Acceptance criteria**
1. A first-time user can create an account and immediately access the product.
2. A returning user can log in with their credentials and get back to their space.
3. Once logged in, the user can see their name somewhere in the interface.
4. An invalid signup or login attempt is rejected with a message a human can understand, not a raw technical error.
5. The session survives a page reload.
6. The user can log out.
```

## Run with claude

```
Use the Atlassian MCP to fetch Jira work item FLOW-5. Read its description and acceptance criteria, then implement the feature end to end in this repo. The backend (backend/, AdonisJS 7) already exists and must not be modified. The frontend (frontend/, React 19 + Vite) is where the work happens. Execute the acceptance criteria as written.
```
