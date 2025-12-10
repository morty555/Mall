import { defineStore } from 'pinia';
import { ref } from 'vue';
import { submitOrder, fetchOrders, getOrderDetail, deleteOrder } from '../services/api/order';
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

export interface OrderCreateInput {
  items: {
    productId: number;
    quantity: number;
    price: number;
  }[];
  address: string;
}

export interface OrderCreatePayload extends OrderCreateInput {
  userId: number;
}

export const useOrderStore = defineStore('order', () => {
  const orders = ref<OrderItem[]>([]);
  const currentOrder = ref<OrderItem | null>(null);
  const loading = ref(false);
  const error = ref<string | null>(null);

  // 获取订单列表
  const fetchOrderHistory = async () => {
    loading.value = true;
    error.value = null;
    try {
      const userStore = useUserStore();
      const response = await fetchOrders(userStore.id);
      orders.value = response.data;
    } catch (err: any) {
      error.value = err.message || 'Failed to fetch orders';
    } finally {
      loading.value = false;
    }
  };

  // 获取单个订单详情
  const fetchOrderDetail = async (orderId: number | string) => {
    loading.value = true;
    error.value = null;
    try {
      const response = await getOrderDetail(Number(orderId));
      currentOrder.value = response.data;
    } catch (err: any) {
      error.value = err.message || 'Failed to fetch order detail';
    } finally {
      loading.value = false;
    }
  };

  // Getter 本地查找订单（可选）
  const getOrder = (orderId: number | string) => {
    return orders.value.find(o => o.id === Number(orderId)) || null;
  };

  // 创建订单
  const createOrder = async (orderInput: OrderCreateInput) => {
    loading.value = true;
    error.value = null;
    try {
      const userStore = useUserStore();
      const payload: OrderCreatePayload = { ...orderInput, userId: userStore.id };
      await submitOrder(payload as any);
      await fetchOrderHistory();
    } catch (err: any) {
      error.value = err.message || 'Failed to submit order';
    } finally {
      loading.value = false;
    }
  };

  // 删除订单
  const removeOrder = async (orderId: number | string) => {
    try {
      await deleteOrder(Number(orderId));
      await fetchOrderHistory();
    } catch (err: any) {
      error.value = err.message || 'Failed to delete order';
    }
  };

  return {
    orders,
    currentOrder,
    loading,
    error,
    fetchOrderHistory,
    fetchOrderDetail,
    createOrder,
    removeOrder,
    getOrder,
  };
});
