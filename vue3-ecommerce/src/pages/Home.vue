<template>
  <div class="home">
    <el-header>
      <h1>Welcome to Our E-commerce Platform</h1>
    </el-header>
    <el-main>
      <div class="featured-products">
        <h2>Featured Products</h2>
        <el-row :gutter="20">
          <el-col v-for="product in products" :key="product.id" :span="6">
            <ProductCard :product="product" />
          </el-col>
        </el-row>
      </div>
    </el-main>
  </div>
</template>

<script lang="ts">
import { defineComponent, ref, onMounted } from 'vue';
import { useProductStore } from '@/stores/product';
import ProductCard from '@/components/product/ProductCard.vue';

export default defineComponent({
  name: 'Home',
  components: {
    ProductCard,
  },
  setup() {
    const productStore = useProductStore();
    const products = ref([]);

    const fetchProducts = async () => {
      products.value = await productStore.fetchFeaturedProducts();
    };

    onMounted(() => {
      fetchProducts();
    });

    return {
      products,
    };
  },
});
</script>

<style scoped>
.home {
  padding: 20px;
}

.featured-products {
  margin-top: 20px;
}
</style>