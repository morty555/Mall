<template>
  <el-card class="product-card" :body-style="{ padding: '20px' }">
    <img :src="product.image" alt="Product Image" class="product-image" />
    <div class="product-info">
      <h3 class="product-title">{{ product.name }}</h3>
      <p class="product-description">{{ product.description }}</p>
      <div class="product-price">
        <span>Price: {{ product.price | currency }}</span>
      </div>
      <el-button type="primary" @click="addToCart">Add to Cart</el-button>
    </div>
  </el-card>
</template>

<script lang="ts">
import { defineComponent } from 'vue';
import { useCartStore, CartItem } from '@/stores/cart';

export interface Product {
  id: number;
  name: string;
  price: number;
  quantity?: number; // 可选，默认 1
  description?: string;
  image?: string;
}

export default defineComponent({
  name: 'ProductCard',
  props: {
    product: {
      type: Object as () => Product,
      required: true,
    },
  },
  setup(props) {
    const cartStore = useCartStore();

    const addToCart = () => {
      const item: CartItem = {
        id: props.product.id,
        name: props.product.name,
        price: props.product.price,
        quantity: 1,
      };
      cartStore.addItem(item);
    };

    return { addToCart };
  },
});
</script>

<style scoped>
.product-card {
  width: 300px;
  margin: 20px;
}

.product-image {
  width: 100%;
  height: auto;
}

.product-info {
  text-align: center;
}

.product-title {
  font-size: 1.5em;
  margin: 10px 0;
}

.product-description {
  font-size: 1em;
  color: #666;
}

.product-price {
  font-size: 1.2em;
  color: #333;
}
</style>
