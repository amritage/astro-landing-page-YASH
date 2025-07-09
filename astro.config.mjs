import { defineConfig } from 'astro/config';
import tailwindcss from '@tailwindcss/vite';
import node from '@astrojs/node';
import compression from 'vite-plugin-compression';
import astroCompress from 'astro-compress'; // <-- add this import

export default defineConfig({
  vite: {
    plugins: [
      tailwindcss(),
      compression({ algorithm: 'gzip' }),
      compression({ algorithm: 'brotliCompress' })
    ],
  },
  output: 'server',
  adapter: node({ mode: 'standalone' }),
  integrations: [
    astroCompress({ brotli: true, gzip: true }) // <-- use the imported function
  ],
});