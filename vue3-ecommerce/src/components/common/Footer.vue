<template>
  <footer class="footer">
    <div class="container">
      <p>&copy; {{ currentYear }} Your E-commerce Platform. All rights reserved.</p>
    </div>
  </footer>
</template>

<script lang="ts" setup>
import { ref } from 'vue';

const currentYear = ref(new Date().getFullYear());
</script>

<style scoped>
.footer {
  background-color: #f5f5f5;
  padding: 20px 0;
  text-align: center;
}

.container {
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 20px;
}
</style>