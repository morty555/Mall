import axios from '../axios';

const API_BASE_URL = '/api/cart';

export interface CartItem {
  id: number;
  name: string;
  price: number;
  quantity: number;
}

export const CartService = {
  // 添加商品到购物车
  addToCart(item: CartItem) {
    return axios.post(`${API_BASE_URL}/add`, item);
  },

  // 更新购物车中商品数量
  updateCartItem(itemId: number, quantity: number) {
    return axios.put(`${API_BASE_URL}/update/${itemId}`, { quantity });
  },

  // 从购物车移除商品
  removeFromCart(itemId: number) {
    return axios.delete(`${API_BASE_URL}/remove/${itemId}`);
  },

  // 获取购物车列表
  getCartItems() {
    return axios.get<CartItem[]>(`${API_BASE_URL}/items`);
  },

  // 清空购物车
  clearCart() {
    return axios.delete(`${API_BASE_URL}/clear`);
  }
};
