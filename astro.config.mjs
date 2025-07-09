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
  // Set output to 'static' for static site deployment (fixes image path issues on global domains)
  output: 'static',
  // Remove SSR adapter for static output
  integrations: [
    astroCompress({ brotli: true, gzip: true }) // <-- use the imported function
  ],
});