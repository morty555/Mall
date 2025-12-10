import { defineStore } from 'pinia';
import { ref, computed } from 'vue';
import { authService, LoginCredentials, RegisterData } from '../services/api/auth';

export const useUserStore = defineStore('user', () => {
  // 初始化从 localStorage 读取数据
  const storedUser = localStorage.getItem('user');
  const storedToken = localStorage.getItem('token');

  const user = ref<any>(storedUser ? JSON.parse(storedUser) : null);
  const token = ref<string | null>(storedToken || null);

  const isAuthenticated = computed(() => !!token.value); // 改成基于 token，不然刷新会失效

  const id = computed(() => user.value?.id ?? null);

  const saveToStorage = () => {
    if (user.value) {
      localStorage.setItem('user', JSON.stringify(user.value));
    }
    if (token.value) {
      localStorage.setItem('token', token.value);
    }
  };

  const login = async (credentials: LoginCredentials) => {
    const data = await authService.login(credentials);

    user.value = data.user;
    token.value = data.token;

    saveToStorage(); // 保存到本地
  };

  const register = async (userData: RegisterData) => {
    const data = await authService.register(userData);

    user.value = data.user;
    token.value = data.token;

    saveToStorage();
  };

  const logout = () => {
    user.value = null;
    token.value = null;
    localStorage.removeItem('user');
    localStorage.removeItem('token');
  };

  return {
    user,
    token,
    id,
    isAuthenticated,
    login,
    register,
    logout,
  };
});
