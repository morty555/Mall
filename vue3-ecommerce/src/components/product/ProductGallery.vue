<template>
  <div class="product-gallery">
    <el-carousel :interval="5000" arrow="always">
      <el-carousel-item v-for="(image, index) in images" :key="index">
        <img :src="image" alt="Product Image" class="gallery-image" />
      </el-carousel-item>
    </el-carousel>
  </div>
</template>

<script lang="ts" setup>
import { defineProps } from 'vue';

const props = defineProps<{
  images: string[];
}>();
</script>

<style scoped>
.product-gallery {
  width: 100%;
  max-width: 600px;
  margin: auto;
}

.gallery-image {
  width: 100%;
  height: auto;
  object-fit: cover;
}
</style>