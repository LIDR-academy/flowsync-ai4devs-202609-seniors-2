import { useState, type FormEvent } from "react";
import { useAuth } from "../auth/context";
import { ApiError } from "../lib/api";

type Mode = "login" | "signup";

type Field = {
  name: string;
  label: string;
  type: string;
  autoComplete: string;
  minLength?: number;
};

const FIELDS: Record<Mode, Field[]> = {
  login: [
    { name: "email", label: "Email", type: "email", autoComplete: "email" },
    {
      name: "password",
      label: "Password",
      type: "password",
      autoComplete: "current-password",
    },
  ],
  signup: [
    { name: "fullName", label: "Name", type: "text", autoComplete: "name" },
    { name: "email", label: "Email", type: "email", autoComplete: "email" },
    {
      name: "password",
      label: "Password",
      type: "password",
      autoComplete: "new-password",
      minLength: 8,
    },
    {
      name: "passwordConfirmation",
      label: "Confirm password",
      type: "password",
      autoComplete: "new-password",
      minLength: 8,
    },
  ],
};

export function AuthScreen() {
  const { login, signup } = useAuth();
  const [mode, setMode] = useState<Mode>("login");
  const [values, setValues] = useState<Record<string, string>>({});
  const [formError, setFormError] = useState<string | null>(null);
  const [fieldErrors, setFieldErrors] = useState<Record<string, string>>({});
  const [submitting, setSubmitting] = useState(false);

  function switchMode(next: Mode) {
    setMode(next);
    setFormError(null);
    setFieldErrors({});
  }

  async function handleSubmit(event: FormEvent<HTMLFormElement>) {
    event.preventDefault();
    setFormError(null);
    setFieldErrors({});

    const email = (values.email ?? "").trim();
    const password = values.password ?? "";

    if (mode === "signup" && password !== values.passwordConfirmation) {
      setFieldErrors({ passwordConfirmation: "Passwords do not match." });
      return;
    }

    setSubmitting(true);
    try {
      if (mode === "login") {
        await login({ email, password });
      } else {
        await signup({
          fullName: (values.fullName ?? "").trim(),
          email,
          password,
          passwordConfirmation: values.passwordConfirmation ?? "",
        });
      }
    } catch (error) {
      if (error instanceof ApiError) {
        setFormError(error.message);
        setFieldErrors(error.fieldErrors);
      } else {
        setFormError("Something unexpected happened. Please try again.");
      }
      setSubmitting(false);
    }
  }

  const isLogin = mode === "login";

  return (
    <main className="auth">
      <div className="card">
        <h1 className="brand">FlowSync</h1>
        <h2>{isLogin ? "Welcome back" : "Create your account"}</h2>
        <p className="muted">
          {isLogin
            ? "Log in to get back to your space."
            : "It only takes a minute to get started."}
        </p>

        <form onSubmit={handleSubmit}>
          {FIELDS[mode].map((field) => {
            const error = fieldErrors[field.name];
            const errorId = `${field.name}-error`;
            return (
              <label key={`${mode}-${field.name}`} className="field">
                <span>{field.label}</span>
                <input
                  name={field.name}
                  type={field.type}
                  autoComplete={field.autoComplete}
                  minLength={field.minLength}
                  required
                  value={values[field.name] ?? ""}
                  onChange={(e) =>
                    setValues((v) => ({ ...v, [field.name]: e.target.value }))
                  }
                  aria-invalid={error ? true : undefined}
                  aria-describedby={error ? errorId : undefined}
                />
                {error && (
                  <span id={errorId} className="field-error">
                    {error}
                  </span>
                )}
              </label>
            );
          })}

          {formError && (
            <p className="form-error" role="alert">
              {formError}
            </p>
          )}

          <button type="submit" className="primary" disabled={submitting}>
            {submitting
              ? isLogin
                ? "Logging in…"
                : "Creating account…"
              : isLogin
                ? "Log in"
                : "Create account"}
          </button>
        </form>

        <p className="switch">
          {isLogin ? "New to FlowSync?" : "Already have an account?"}{" "}
          <button
            type="button"
            className="link"
            onClick={() => switchMode(isLogin ? "signup" : "login")}
          >
            {isLogin ? "Create an account" : "Log in"}
          </button>
        </p>
      </div>
    </main>
  );
}
