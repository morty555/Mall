import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'
import { createHtmlPlugin } from 'vite-plugin-html'

export default defineConfig({
  plugins: [
    vue(),
    createHtmlPlugin({
      minify: true,
      inject: {
        tags: [
          {
            tag: 'link',
            attrs: {
              rel: 'stylesheet',
              href: 'https://unpkg.com/element-plus/dist/index.css'
            }
          }
        ]
      }
    })
  ],

  // ---- 这里是你要加的位置 ----
  server: {
    port: 3000,
    open: true,
    proxy: {
      '/api': {
        target: 'http://localhost:8080',
        changeOrigin: true
      }
    }
  },
  // ----------------------------------

  build: {
    outDir: 'dist',
    sourcemap: true
  },

  resolve: {
    alias: {
      '@': '/src'
    }
  }
})
