import { defineStore } from 'pinia';
import { ref, computed } from 'vue';

// Cart item 类型
export interface CartItem {
  id: number;
  name: string;
  price: number;
  quantity: number;
}

export const useCartStore = defineStore('cart', () => {
  const items = ref<CartItem[]>([]);

  const addItem = (product: CartItem) => {
    const existing = items.value.find(item => item.id === product.id);
    if (existing) {
      existing.quantity += product.quantity;
    } else {
      items.value.push({ ...product });
    }
  };

  const removeItem = (id: number) => {
    items.value = items.value.filter(item => item.id !== id);
  };

  const clearCart = () => {
    items.value = [];
  };

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
