import {
  useCallback,
  useEffect,
  useMemo,
  useState,
  type ReactNode,
} from "react";
import * as api from "../lib/api";
import { AuthContext, type AuthContextValue, type AuthState } from "./context";
import { clearToken, readToken, writeToken } from "./tokenStorage";

export function AuthProvider({ children }: { children: ReactNode }) {
  const [token, setToken] = useState<string | null>(readToken);
  const [state, setState] = useState<AuthState>(() =>
    token ? { status: "loading" } : { status: "anonymous" },
  );
  const [attempt, setAttempt] = useState(0);

  // Restore the session on first load (and on retry): a stored token is only
  // trusted once the backend confirms it by returning the profile.
  useEffect(() => {
    const storedToken = readToken();
    if (!storedToken) return;

    let cancelled = false;
    api
      .fetchProfile(storedToken)
      .then((user) => {
        if (!cancelled) setState({ status: "authenticated", user });
      })
      .catch((error: api.ApiError) => {
        if (cancelled) return;
        if (error.status === 401) {
          clearToken();
          setToken(null);
          setState({ status: "anonymous" });
        } else {
          setState({ status: "unreachable", message: error.message });
        }
      });

    return () => {
      cancelled = true;
    };
  }, [attempt]);

  const startSession = useCallback(
    (payload: { user: api.User; token: string }) => {
      writeToken(payload.token);
      setToken(payload.token);
      setState({ status: "authenticated", user: payload.user });
    },
    [],
  );

  const login = useCallback<AuthContextValue["login"]>(
    async (input) => startSession(await api.login(input)),
    [startSession],
  );

  const signup = useCallback<AuthContextValue["signup"]>(
    async (input) => startSession(await api.signup(input)),
    [startSession],
  );

  const logout = useCallback(async () => {
    if (token) {
      // Revoke the token server-side, but never keep the user stuck in the
      // app if that call fails: the local session is cleared regardless.
      await api.logout(token).catch(() => undefined);
    }
    clearToken();
    setToken(null);
    setState({ status: "anonymous" });
  }, [token]);

  const retry = useCallback(() => {
    setState({ status: "loading" });
    setAttempt((n) => n + 1);
  }, []);

  const value = useMemo(
    () => ({ state, login, signup, logout, retry }),
    [state, login, signup, logout, retry],
  );

  return <AuthContext value={value}>{children}</AuthContext>;
}
