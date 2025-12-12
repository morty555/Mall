import axios from '../axios';

const API_BASE_URL = '/api/orders';

interface OrderData {
  productId: number;
  quantity: number;
  price: number;
  address: string;
  userId: number;
}

export function submitOrder(orderData: OrderData) {
  return axios.post(`${API_BASE_URL}/submit`, orderData);
}

export function fetchOrders(userId: number) {
  return axios.get(`${API_BASE_URL}/list`, { params: { userId }});
}

export function getOrderDetail(orderId: number) {
  return axios.get(`${API_BASE_URL}/list`, { params: { orderId }});
}

export function deleteOrder(orderId: number) {
  return axios.delete(`${API_BASE_URL}/delete`, { data: { orderId }});
}
