import { defineStore } from 'pinia';
import { ref, computed } from 'vue';

// Cart item 类型
export interface CartItem {
  id: number;
  name: string;
  price: number;
  quantity: number;
}

// Pinia Store
export const useCartStore = defineStore('cart', () => {
  const items = ref<CartItem[]>([]);

  // 添加商品到购物车
  const addItem = (product: CartItem) => {
    const existing = items.value.find(item => item.id === product.id);
    if (existing) {
      existing.quantity += product.quantity;
    } else {
      items.value.push({ ...product });
    }
  };

  // 从购物车移除商品
  const removeItem = (id: number) => {
    items.value = items.value.filter(item => item.id !== id);
  };

  // 清空购物车
  const clearCart = () => {
    items.value = [];
  };

  // 购物车总价
  const totalPrice = computed(() =>
    items.value.reduce((sum, item) => sum + item.price * item.quantity, 0)
  );

  return {
    items,
    addItem,
    removeItem,
    clearCart,
    totalPrice,
  };
});
