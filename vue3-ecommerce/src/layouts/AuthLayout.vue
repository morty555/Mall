<template>
  <div class="auth-layout">
    <header>
      <h1>Welcome to Our E-commerce Platform</h1>
    </header>
    <main>
      <slot></slot>
    </main>
    <footer>
      <p>&copy; 2023 E-commerce Platform. All rights reserved.</p>
    </footer>
  </div>
</template>

<script lang="ts">
import { defineComponent } from 'vue';

export default defineComponent({
  name: 'AuthLayout',
});
</script>

<style scoped>
.auth-layout {
  display: flex;
  flex-direction: column;
  min-height: 100vh;
}

header {
  background-color: #f5f5f5;
  padding: 20px;
  text-align: center;
}

main {
  flex: 1;
  display: flex;
  justify-content: center;
  align-items: center;
}

footer {
  background-color: #f5f5f5;
  padding: 10px;
  text-align: center;
}
</style>