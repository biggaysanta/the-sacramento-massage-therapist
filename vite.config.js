import { defineConfig } from "vite";
import tailwindcss from "@tailwindcss/vite";

export default defineConfig({
  server: {
    proxy: {
      // Forward all requests from Vite's port to Hugo's port (1313)
      '/': {
        target: 'http://localhost:1313',
        changeOrigin: true,
      }
    }
  },
  plugins: [ 
    tailwindcss(),
  ],
});