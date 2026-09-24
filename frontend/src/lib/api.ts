const API_BASE_URL = import.meta.env.VITE_API_URL ?? "/api/v1";

export type User = {
  id: number;
  fullName: string | null;
  email: string;
  initials: string;
  createdAt: string;
  updatedAt: string;
};

type AuthPayload = { user: User; token: string };

type BackendError = {
  message: string;
  rule?: string;
  field?: string;
  meta?: Record<string, unknown>;
};

/**
 * Error raised for any failed API call. `message` is always safe to show to
 * a user; `fieldErrors` maps form fields to their own human message.
 */
export class ApiError extends Error {
  readonly status: number;
  readonly fieldErrors: Record<string, string>;

  constructor(
    status: number,
    message: string,
    fieldErrors: Record<string, string> = {},
  ) {
    super(message);
    this.name = "ApiError";
    this.status = status;
    this.fieldErrors = fieldErrors;
  }
}

const FIELD_LABELS: Record<string, string> = {
  fullName: "Name",
  email: "Email",
  password: "Password",
  passwordConfirmation: "Password confirmation",
};

function humanizeFieldError(error: BackendError): string {
  const label = FIELD_LABELS[error.field ?? ""] ?? "This field";

  switch (error.rule) {
    case "required":
      return `${label} is required.`;
    case "email":
      return "Please enter a valid email address.";
    case "database.unique":
      return "An account with this email already exists. Try logging in instead.";
    case "minLength":
      return `${label} must be at least ${error.meta?.min ?? 8} characters.`;
    case "maxLength":
      return `${label} must be at most ${error.meta?.max} characters.`;
    case "sameAs":
      return "Passwords do not match.";
    default:
      return `${label} is invalid.`;
  }
}

async function toApiError(response: Response): Promise<ApiError> {
  let errors: BackendError[] = [];
  try {
    const body = await response.json();
    if (Array.isArray(body?.errors)) errors = body.errors;
  } catch {
    // Non-JSON body: fall through to the generic messages below.
  }

  if (response.status === 422) {
    const fieldErrors: Record<string, string> = {};
    for (const error of errors) {
      if (error.field && !fieldErrors[error.field]) {
        fieldErrors[error.field] = humanizeFieldError(error);
      }
    }
    return new ApiError(
      422,
      "Please fix the highlighted fields and try again.",
      fieldErrors,
    );
  }

  if (
    response.status === 400 &&
    errors[0]?.message === "Invalid user credentials"
  ) {
    return new ApiError(400, "Incorrect email or password. Please try again.");
  }

  if (response.status === 401) {
    return new ApiError(401, "Your session has expired. Please log in again.");
  }

  if (response.status === 429) {
    return new ApiError(
      429,
      "Too many attempts. Please wait a moment and try again.",
    );
  }

  return new ApiError(
    response.status,
    "Something went wrong on our side. Please try again in a moment.",
  );
}

async function request<T>(
  path: string,
  options: { method?: string; body?: unknown; token?: string | null } = {},
): Promise<T> {
  const headers: Record<string, string> = { Accept: "application/json" };
  if (options.body !== undefined) headers["Content-Type"] = "application/json";
  if (options.token) headers.Authorization = `Bearer ${options.token}`;

  let response: Response;
  try {
    response = await fetch(`${API_BASE_URL}${path}`, {
      method: options.method ?? "GET",
      headers,
      body:
        options.body !== undefined ? JSON.stringify(options.body) : undefined,
    });
  } catch {
    throw new ApiError(
      0,
      "Can't reach FlowSync right now. Check your connection and try again.",
    );
  }

  if (!response.ok) throw await toApiError(response);
  return response.json() as Promise<T>;
}

export async function signup(input: {
  fullName: string;
  email: string;
  password: string;
  passwordConfirmation: string;
}): Promise<AuthPayload> {
  const { data } = await request<{ data: AuthPayload }>("/auth/signup", {
    method: "POST",
    body: input,
  });
  return data;
}

export async function login(input: {
  email: string;
  password: string;
}): Promise<AuthPayload> {
  const { data } = await request<{ data: AuthPayload }>("/auth/login", {
    method: "POST",
    body: input,
  });
  return data;
}

export async function fetchProfile(token: string): Promise<User> {
  const { data } = await request<{ data: User }>("/account/profile", { token });
  return data;
}

export async function logout(token: string): Promise<void> {
  await request("/account/logout", { method: "POST", token });
}
