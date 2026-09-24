import { createContext, useContext } from "react";
import type { User } from "../lib/api";

export type AuthState =
  | { status: "loading" }
  | { status: "anonymous" }
  | { status: "unreachable"; message: string }
  | { status: "authenticated"; user: User };

export type AuthContextValue = {
  state: AuthState;
  login: (input: { email: string; password: string }) => Promise<void>;
  signup: (input: {
    fullName: string;
    email: string;
    password: string;
    passwordConfirmation: string;
  }) => Promise<void>;
  logout: () => Promise<void>;
  retry: () => void;
};

export const AuthContext = createContext<AuthContextValue | null>(null);

export function useAuth(): AuthContextValue {
  const value = useContext(AuthContext);
  if (!value) throw new Error("useAuth must be used inside <AuthProvider>");
  return value;
}
