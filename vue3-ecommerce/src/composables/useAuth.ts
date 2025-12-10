import { ref } from 'vue';
import { useStore } from 'pinia';
import { useRouter } from 'vue-router';
import { login as apiLogin, register as apiRegister } from '@/services/api/auth';

export function useAuth() {
  const store = useStore();
  const router = useRouter();
  const errorMessage = ref('');

  const login = async (credentials) => {
    try {
      const response = await apiLogin(credentials);
      store.user.setUser(response.data);
      localStorage.setItem('token', response.data.token);
      router.push({ name: 'Home' });
    } catch (error) {
      errorMessage.value = error.response?.data?.message || 'Login failed';
    }
  };

  const register = async (userData) => {
    try {
      await apiRegister(userData);
      router.push({ name: 'Login' });
    } catch (error) {
      errorMessage.value = error.response?.data?.message || 'Registration failed';
    }
  };

  const logout = () => {
    store.user.clearUser();
    localStorage.removeItem('token');
    router.push({ name: 'Login' });
  };

  const isAuthenticated = () => {
    return !!localStorage.getItem('token');
  };

  return {
    errorMessage,
    login,
    register,
    logout,
    isAuthenticated,
  };
}