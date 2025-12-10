/// <reference types="vite/client" />

interface ImportMetaEnv {
  readonly VITE_API_BASE_URL: string;
  // 你其他的 VITE_ 环境变量
}

interface ImportMeta {
  readonly env: ImportMetaEnv;
}
