import {defineConfig} from 'vite'
import react from '@vitejs/plugin-react'
import vitePluginWasm from 'vite-plugin-wasm'
import mkcert from 'vite-plugin-mkcert'

// https://vitejs.dev/config/
export default defineConfig({
  plugins: [react(), vitePluginWasm(), mkcert()],
  server: {
    headers: {
      'Cross-Origin-Opener-Policy': 'same-origin',
      'Cross-Origin-Embedder-Policy': 'require-corp',
      'aboba': 'foo'
    }
  }
})
