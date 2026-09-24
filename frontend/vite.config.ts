import { defineConfig } from "vite";
import react from "@vitejs/plugin-react";

// https://vite.dev/config/
export default defineConfig({
  plugins: [react()],
  server: {
    // Forward API calls to the AdonisJS backend so the app can use relative
    // URLs (`/api/v1/...`) in development.
    proxy: {
      "/api": "http://localhost:3333",
    },
  },
});
