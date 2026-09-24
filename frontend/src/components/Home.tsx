import { useState } from "react";
import { useAuth } from "../auth/context";
import type { User } from "../lib/api";

export function Home({ user }: { user: User }) {
  const { logout } = useAuth();
  const [loggingOut, setLoggingOut] = useState(false);
  const displayName = user.fullName?.trim() || user.email;

  async function handleLogout() {
    setLoggingOut(true);
    await logout();
  }

  return (
    <div className="home">
      <header className="topbar">
        <span className="brand">FlowSync</span>
        <div className="account">
          <span className="avatar" aria-hidden="true">
            {user.initials}
          </span>
          <span className="account-name">{displayName}</span>
          <button type="button" onClick={handleLogout} disabled={loggingOut}>
            {loggingOut ? "Logging out…" : "Log out"}
          </button>
        </div>
      </header>

      <main className="space">
        <h1>Welcome, {displayName}</h1>
        <p className="muted">
          This is your space. You're signed in as {user.email}.
        </p>
      </main>
    </div>
  );
}
