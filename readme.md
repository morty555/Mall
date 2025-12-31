<!-- ...existing code... -->

# Mall — Vue3 / Vite 电商管理与前端示例工程
学号：202330451771 姓名：王伫源

简介
- 本仓库包含前端 (Vue 3 + TypeScript + Vite) 项目 `vue3-ecommerce`，以及后端示例工程 `MallBackEnd`（Spring Boot / Maven）。
- 前端包含：Vue 3 (Composition API)、Pinia、Vue Router 4、Element Plus、Axios、ECharts（用于报表）、Mock（开发时可启用）。
- 目标：可运行的电商前端与管理端页面（商品/订单/客户/日志/报表），代码结构模块化、可维护，方便开发与扩展。

目录结构（核心）
- /vue3-ecommerce
  - src/
    - main.ts                 — 启动文件（DEV 会按需加载 mock）
    - router/index.ts         — 路由与路由守卫
    - stores/                 — Pinia store（user, product, cart, order 等）
    - services/axios.ts       — axios 封装（请求/响应拦截、token）
    - services/api/*.ts       — 各类接口封装（auth, product, cart, order, admin）
    - pages/                  — 前端页面（登录、商品列表、详情、购物车、订单等）
    - admin/                  — （可选）管理端页面（商品管理、订单管理、报表等）
    - mock/                   — Mock 数据（开发可启用）
    - components/             — 可复用组件（分页、头尾、产品卡片等）
  - package.json
- /MallBackEnd
  - demo/                    — 后端 Spring Boot 示例工程（pom.xml，若需本地运行）

快速开始（前端）
1. 进入前端目录
   cd vue3-ecommerce

2. 安装依赖
   npm install
   或
   pnpm install
   或
   yarn

3. 运行开发服务器
   npm run dev

4. 常用脚本（参见 package.json）
   - dev: 本地开发
   - build: 打包
   - preview: 本地预览打包结果
   - lint / test: 如配置

后端运行（示例）
1. 进入后端示例目录
   cd MallBackEnd/demo

2. 使用 Maven 运行（系统需安装 Java+Maven）
   ./mvnw spring-boot:run
   或
   mvn spring-boot:run

3. 默认端口通常为 8080（请参阅 application.yml）

环境配置
- 前端：
  - .env / .env.development 可通过 Vite 的 VITE_* 前缀配置，如：
    VITE_API_BASE_URL=http://localhost:8080/api
  - axios baseURL 可在 src/services/axios.ts 中修改或通过环境变量注入。

Mock（开发）
- 项目在 main.ts 中会在 dev 环境按需加载 /src/mock（如果存在）。
- Mock 使用 Mock.js，接口前缀通常以 `/api` 开头，便于在开发时拦截请求而不修改前端调用逻辑。
- 生产环境请移除或禁用 mock。

鉴权与 token
- axios 请求拦截器会从 localStorage 读取 token（key: `token`）并注入 Authorization 头。
- 路由守卫（router/index.ts）检查 token，受保护路由（如购物车、订单、管理端）会跳转到登录页面。
- 登录后 token 建议持久化到 localStorage（或 cookies），并在页面刷新时用 Pinia 恢复用户状态（自动登录）。

重要实现说明
- axios 封装：统一请求/响应拦截、错误处理、token 注入（src/services/axios.ts）。
- Pinia store：每个 domain 一个 store（src/stores），store 负责数据拉取、loading、错误处理和简单转换。
- Types：建议统一在 src/types 下定义 DTO/接口以避免同名类型冲突（例如 order 类型冲突会导致 TS 报错）。
- 路由：Vue Router 4 + 路由守卫。管理端路由可放在 /src/admin 并按需懒加载组件。
- 管理端（Admin）：包含商品目录管理、订单管理、统计报表（ECharts）、客户与行为日志页面，使用 Mock.js 提供演示数据。

常见问题与解决
- error: "Module ... has no default export"
  - 原因：store 使用命名导出（export const useX），但聚合导入使用默认导入。方案：在 src/stores/index.ts 使用命名导出聚合，或修改 import 为命名导入。
- TypeScript 类型不兼容（payload 报错）
  - 原因：不同文件夹中同名类型定义不一致。建议在 src/types 中定义共享类型并在 services / stores 中统一引用。
- Mock 不生效
  - 检查 main.ts 是否在 DEV 环境动态 import('./mock') 并确保 mock 文件注册了 Mock.mock 路由。

部署
- 前端：npm run build -> 将 dist 上传到静态服务器或由后端提供静态资源。
- 后端：构建 jar（mvn clean package）并在服务器运行。

开发建议
- 将 DTO/types 抽取到 src/types 并在 API 和 store 中 import type。
- 在 services/api/* 中导出请求/响应类型（export type），store 里 import 使用，避免 any/类型断言。
- 为关键 store 添加单元测试（Vitest/Jest），并使用 CI 校验 lint 与 type-check。

联系方式 / 贡献
- 该 README 仅为本地开发与调试说明。若需要我将管理端完整文件写入你的工作区（src/admin、src/mock、stores/admin 等）并自动修改 main.ts / router，请回复确认具体需求。

LICENSE
- 此仓库示例模板，按需补充