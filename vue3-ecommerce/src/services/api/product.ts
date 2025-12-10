import axios from 'axios';

// Create an instance of axios
const apiClient = axios.create({
  baseURL: import.meta.env.VITE_API_BASE_URL, // Base URL from environment variables
  timeout: 10000, // Request timeout
});

// Request interceptor to add token to headers
apiClient.interceptors.request.use(
  (config) => {
    const token = localStorage.getItem('token'); // Retrieve token from localStorage
    if (token) {
      config.headers.Authorization = `Bearer ${token}`; // Set Authorization header
    }
    return config;
  },
  (error) => {
    return Promise.reject(error);
  }
);

// Response interceptor to handle errors
apiClient.interceptors.response.use(
  (response) => response, // 返回完整响应，store 里取 .data
  (error) => {
    if (error.response && error.response.status === 401) {
      // 处理未授权，比如跳转登录
    }
    return Promise.reject(error);
  }
);

// API calls related to product management
export const productApi = {
  fetchProducts(page = 1, limit = 10, filters: Record<string, any> = {}) {
    return apiClient.get('/products', {
      params: {
        page,
        limit,
        ...filters,
      },
    });
  },

  fetchProductById(productId: string | number) {
    return apiClient.get(`/products/${productId}`);
  },

  searchProducts(keyword: string) {
    return apiClient.get('/products/search', {
      params: { keyword },
    });
  },

  fetchProductsByCategory(categoryId: string | number) {
    return apiClient.get(`/products/category/${categoryId}`);
  },
};
