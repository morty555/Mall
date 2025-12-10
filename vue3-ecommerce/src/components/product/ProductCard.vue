<template>
  <el-card class="product-card" :body-style="{ padding: '20px' }">
    <img
      :src="product.image || placeholderImage"
      alt="Product Image"
      class="product-image"
    />
    <div class="product-info">
      <h3 class="product-title">{{ product.name || 'Unnamed Product' }}</h3>
      <p class="product-description">
        {{ product.description || 'No description available.' }}
      </p>
      <div class="product-price">
        <span>Price: ${{ (product.price || 0).toFixed(2) }}</span>
      </div>
      <el-button
        type="primary"
        @click="addToCart"
        :disabled="added || !(product.id > 0)"
      >
        {{ added ? 'Added to Cart' : 'Add to Cart' }}
      </el-button>
    </div>
  </el-card>
</template>

<script lang="ts">
import { defineComponent, ref } from 'vue';
import { useCartStore, CartItem } from '@/stores/cart';
import { ElMessage } from 'element-plus';

export interface Product {
  id: number;
  name: string;
  price: number;
  description?: string;
  image?: string;
  stock?: number;
  categoryId?: number | null;
  specifications?: string | null;
  featured?: boolean;
  createdAt?: string;
  updatedAt?: string;
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
    const placeholderImage = '/placeholder.png';
    const added = ref(false); // 控制按钮文字和状态

    const addToCart = () => {
      if (!(props.product.id > 0)) {
        console.warn('Product ID missing, cannot add to cart');
        return;
      }

      const item: CartItem = {
        id: props.product.id,
        name: props.product.name,
        price: props.product.price,
        quantity: 1,
      };

      cartStore.addItem(item);

      added.value = true; // 更新按钮状态
      ElMessage({
        message: `${props.product.name} 已添加到购物车`,
        type: 'success',
        duration: 1500,
      });

      // 2秒后恢复按钮状态，可按需修改
      setTimeout(() => {
        added.value = false;
      }, 2000);
    };

    return {
      addToCart,
      placeholderImage,
      added,
    };
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
  height: 200px;
  object-fit: cover;
  background-color: #f0f0f0;
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
  min-height: 40px;
}

.product-price {
  font-size: 1.2em;
  color: #f56c6c;
  margin: 10px 0;
}
</style>
