// ...existing code...
// 统一导出各个 store 的命名导出，避免默认导入导致的错误
export { useUserStore } from './user';
export { useProductStore } from './product';
export { useCartStore } from './cart';
export { useOrderStore } from './order';
// ...existing code...