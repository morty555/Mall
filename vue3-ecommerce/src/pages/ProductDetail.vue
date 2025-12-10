<template>
  <div class="product-detail">
    <el-card>
      <div class="product-gallery">
        <ProductGallery :images="product.images" />
      </div>
      <div class="product-info">
        <h2>{{ product.name }}</h2>
        <p>{{ product.description }}</p>
        <el-tag v-for="spec in product.specifications" :key="spec">{{ spec }}</el-tag>
        <div class="price">
          <span>Price: {{ product.price }} USD</span>
        </div>
        <div class="stock">
          <span v-if="product.stock > 0">In Stock: {{ product.stock }}</span>
          <span v-else>Out of Stock</span>
        </div>
        <el-button type="primary" @click="addToCart" :disabled="product.stock === 0">Add to Cart</el-button>
      </div>
    </el-card>
  </div>
</template>

<script lang="ts">
import { defineComponent, ref, onMounted } from 'vue';
import { useRoute } from 'vue-router';
import { useProductStore } from '@/stores/product';
import ProductGallery from '@/components/product/ProductGallery.vue';

export default defineComponent({
  components: {
    ProductGallery,
  },
  setup() {
    const route = useRoute();
    const productStore = useProductStore();
    const product = ref(null);

    const fetchProductDetail = async () => {
      const productId = route.params.id;
      product.value = await productStore.getProductDetail(productId);
    };

    const addToCart = () => {
      if (product.value) {
        productStore.addToCart(product.value);
      }
    };

    onMounted(() => {
      fetchProductDetail();
    });

    return {
      product,
      addToCart,
    };
  },
});
</script>

<style scoped>
.product-detail {
  padding: 20px;
}
.product-gallery {
  margin-bottom: 20px;
}
.product-info {
  text-align: left;
}
.price {
  font-size: 1.5em;
  color: #f56c6c;
}
.stock {
  margin: 10px 0;
}
</style>