import axios from 'axios';

// Create an instance of axios
const apiClient = axios.create({
  baseURL: import.meta.env.VITE_API_BASE_URL, // Base URL from environment variables
  timeout: 10000, // Request timeout
});

// Request interceptor
apiClient.interceptors.request.use(
  (config) => {
    const token = localStorage.getItem('token'); // Retrieve token from localStorage
    if (token) {
      config.headers.Authorization = `Bearer ${token}`; // Set Authorization header
    }
    return config;
  },
  (error) => {
    return Promise.reject(error); // Handle request error
  }
);

// Response interceptor
apiClient.interceptors.response.use(
  (response) => {
    return response.data; // Return response data directly
  },
  (error) => {
    if (error.response && error.response.status === 401) {
      // Handle unauthorized access (e.g., redirect to login)
      localStorage.removeItem('token'); // Remove token on unauthorized
    }
    return Promise.reject(error); // Handle response error
  }
);

export default apiClient;