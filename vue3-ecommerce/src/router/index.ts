import { createRouter, createWebHistory } from 'vue-router';
import Home from '../pages/Home.vue';
import Login from '../pages/Login.vue';
import Register from '../pages/Register.vue';
import ProductList from '../pages/ProductList.vue';
import ProductDetail from '../pages/ProductDetail.vue';
import Cart from '../pages/Cart.vue';
import Checkout from '../pages/Checkout.vue';
import Orders from '../pages/Orders.vue';
import OrderDetail from '../pages/OrderDetail.vue';
import { useUserStore } from '../stores/user';

const routes = [
  { path: '/', component: Home },
  { path: '/login', component: Login },
  { path: '/register', component: Register },
  { path: '/products', component: ProductList },
  { path: '/products/:id', component: ProductDetail },
  { path: '/cart', component: Cart, meta: { requiresAuth: true } },
  { path: '/checkout', component: Checkout, meta: { requiresAuth: true } },
  { path: '/orders', component: Orders, meta: { requiresAuth: true } },
  { path: '/orders/:id', component: OrderDetail, meta: { requiresAuth: true } },
];

const router = createRouter({
  history: createWebHistory(),
  routes,
});

// Route guard for protected routes
router.beforeEach((to, from, next) => {
  const userStore = useUserStore();
  const isAuthenticated = userStore.isAuthenticated;

  if (to.meta.requiresAuth && !isAuthenticated) {
    next({ path: '/login' });
  } else {
    next();
  }
});

export default router;