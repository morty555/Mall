import { defineStore } from 'pinia';
import { ref } from 'vue';
import { submitOrder, fetchOrders, getOrderDetail, deleteOrder } from '../services/api/order';
import { useUserStore } from './user';

// 【已修正】OrderItem 接口：匹配后端返回的 totalPrice, address, phone 字段
export interface OrderItem {
  id: number;
  userId: number;
  items: {
    productId: number;
    quantity: number;
    price: number;
    productName: string; // <-- 确保列表数据中的 item 包含此字段
    // 如果需要其他字段，比如 productID: number, orderId: number 等，也应在此添加
  }[];
  totalPrice: number; // <-- 修正为 totalPrice
  status: string;
  createdAt: string;
  address: string;   // <-- 添加收货地址
  phone: string;     // <-- 添加电话
}

export interface OrderCreateInput {
  items: {
    productId: number;
    quantity: number;
    price: number;
  }[];
  address: string; 
  phone: string;
}

export interface OrderCreatePayload extends OrderCreateInput {
  userId: number;
}

export const useOrderStore = defineStore('order', () => {
  const orders = ref<OrderItem[]>([]);
  // currentOrder 在此方案中不再使用，但保留以防其他组件需要
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
      
      // 【关键修正】因为 response 本身就是数组，使用两步断言
      orders.value = response as unknown as OrderItem[]; 
      
    } catch (err: any) {
      error.value = err.message || 'Failed to fetch orders';
    } finally {
      loading.value = false;
    }
  };

  // 获取单个订单详情 (保留此方法，但OrderDetail组件不再调用它)
  const fetchOrderDetail = async (orderId: number | string) => {
    loading.value = true;
    error.value = null;
    try {
      // ⚠️ 注意：此方法依赖 getOrderDetail API，如果 API 仍有问题，此方法会失败。
      const response = await getOrderDetail(Number(orderId));
      currentOrder.value = response as unknown as OrderItem;
    } catch (err: any) {
      error.value = err.message || 'Failed to fetch order detail';
    } finally {
      loading.value = false;
    }
  };

  // Getter 本地查找订单（OrderDetails组件中通过 computed 属性实现了相同的逻辑）
  const getOrder = (orderId: number | string) => {
    return orders.value.find(o => o.id === Number(orderId)) || null;
  };

  // 创建订单 (保留)
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

  // 删除订单 (保留)
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