import axios from '../axios';

const API_URL = '/api/auth';

export interface LoginCredentials {
  email: string;
  password: string;
}


export interface RegisterData {
  username: string;
  password: string;
  email?: string;
}

export const authService = {
  login(credentials: LoginCredentials) {
  return axios.post(`${API_URL}/login`, credentials)
    .then(res => {
      // 保存登录用户信息和 token
      localStorage.setItem('user', JSON.stringify(res.data));
      return res.data;
    });
},

  register(userData: RegisterData) {
    return axios.post(`${API_URL}/register`, userData)
      .then(res => res.data); // ✅ 返回 data
  },

  logout() {
    localStorage.removeItem('user');
  },

  getCurrentUser() {
    return JSON.parse(localStorage.getItem('user') || 'null');
  }
};

