<template>
  <header class="header">
    <div class="logo">
      <router-link to="/">E-Commerce</router-link>
    </div>

    <nav>
      <ul>
        <li><router-link to="/">Home</router-link></li>
        <li><router-link to="/products">Products</router-link></li>
        <li><router-link to="/cart">Cart</router-link></li>
        <li><router-link to="/orders">Orders</router-link></li>

        <!-- 未登录显示 -->
        <template v-if="!isAuthenticated">
          <li><router-link to="/login">Login</router-link></li>
          <li><router-link to="/register">Register</router-link></li>
        </template>

        <!-- 已登录显示 -->
        <template v-else>
          <li>👋 {{ user?.email }}</li>
          <li class="clickable" @click="handleLogout">Logout</li>
        </template>
      </ul>
    </nav>
  </header>
</template>

<script lang="ts">
import { defineComponent, computed } from 'vue';
import { useUserStore } from '@/stores/user';
import { ElMessage } from 'element-plus';
import { useRouter } from 'vue-router';

export default defineComponent({
  setup() {
    const userStore = useUserStore();
    const router = useRouter();

    // 让状态变成响应式
    const isAuthenticated = computed(() => userStore.isAuthenticated);
    const user = computed(() => userStore.user);

    const handleLogout = () => {
      userStore.logout();
      ElMessage.success("已退出登录");
      router.push("/"); // 👈 退出后返回首页
    };

    return {
      isAuthenticated,
      user,
      handleLogout,
    };
  },
});
</script>

<style scoped>
.header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 1rem;
  background-color: #f5f5f5;
}

.logo {
  font-size: 1.5rem;
  font-weight: bold;
}

nav ul {
  list-style: none;
  display: flex;
  gap: 1rem;
}

nav a {
  text-decoration: none;
  color: #333;
}

nav a:hover {
  text-decoration: underline;
}

.clickable {
  cursor: pointer;
  color: red;
}
.clickable:hover {
  text-decoration: underline;
}
</style>
