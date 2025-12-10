import { defineStore } from 'pinia';
import { ref } from 'vue';
import { submitOrder, fetchOrders } from '../services/api/order';
import { useUserStore } from './user';

export interface OrderItem {
  id: number;
  userId: number;
  items: {
    productId: number;
    quantity: number;
    price: number;
  }[];
  total: number;
  status: string;
  createdAt: string;
}

// 组件传入的创建订单输入（去掉 userId）
export interface OrderCreateInput {
  items: {
    productId: number;
    quantity: number;
    price: number;
  }[];
  address: string;
}

// store 内部发送到后端的完整载荷类型（与后端契约保持一致）
export interface OrderCreatePayload extends OrderCreateInput {
  userId: number;
}

export const useOrderStore = defineStore('order', () => {
  const orders = ref<OrderItem[]>([]);
  const loading = ref(false);
  const error = ref<string | null>(null);

  // 获取用户订单历史
  const fetchOrderHistory = async () => {
    loading.value = true;
    error.value = null;
    try {
      const userStore = useUserStore();
      const response = await fetchOrders(userStore.id); // 传入用户ID
      orders.value = response.data as OrderItem[];
    } catch (err: unknown) {
      error.value = (err as Error).message || 'Failed to fetch orders';
    } finally {
      loading.value = false;
    }
  };

  // 创建订单：组件只需要传 items 和 address
  const createOrder = async (orderInput: OrderCreateInput) => {
    loading.value = true;
    error.value = null;
    try {
      const userStore = useUserStore();
      const payload: OrderCreatePayload = {
        ...orderInput,
        userId: userStore.id, // 自动加上用户ID
      };
      // 注意：这里做类型断言以避免与 services/api/order.ts 中同名但结构不同的类型冲突。
      // 推荐改进：在 services/api/order.ts 中导出请求类型，例如 `export interface OrderData`，
      // 然后在此处 `import type { OrderData as APIOrderData } from '../services/api/order'`
      // 并替换下面的 `as any` 为 `as APIOrderData`。
      await submitOrder(payload as any);
      await fetchOrderHistory();
    } catch (err: unknown) {
      error.value = (err as Error).message || 'Failed to submit order';
    } finally {
      loading.value = false;
    }
  };

  return {
    orders,
    loading,
    error,
    fetchOrderHistory,
    createOrder,
  };
});