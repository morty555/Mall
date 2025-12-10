<template>
  <div>
    <Header />
    <main>
      <slot></slot>
    </main>
    <Footer />
  </div>
</template>

<script setup lang="ts">
import Header from '@/components/common/Header.vue';
import Footer from '@/components/common/Footer.vue';
</script>


<style scoped>
main {
  padding: 20px;
}
</style>