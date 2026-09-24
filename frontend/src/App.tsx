import { useAuth } from "./auth/context";
import { AuthScreen } from "./components/AuthScreen";
import { Home } from "./components/Home";
import "./App.css";

function App() {
  const { state, retry } = useAuth();

  switch (state.status) {
    case "loading":
      return (
        <main className="centered" aria-busy="true">
          <p className="muted">Loading your space…</p>
        </main>
      );
    case "unreachable":
      return (
        <main className="centered">
          <p className="form-error" role="alert">
            {state.message}
          </p>
          <button type="button" className="primary" onClick={retry}>
            Try again
          </button>
        </main>
      );
    case "anonymous":
      return <AuthScreen />;
    case "authenticated":
      return <Home user={state.user} />;
  }
}

export default App;
