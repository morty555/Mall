<template>
  <div class="cart-item">
    <el-card>
      <div class="cart-item-content">
        <img :src="item.image" alt="Product Image" class="cart-item-image" />
        <div class="cart-item-details">
          <h3 class="cart-item-title">{{ item.title }}</h3>
          <p class="cart-item-price">Price: {{ item.price | currency }}</p>
          <el-input-number
            v-model="quantity"
            :min="1"
            @change="updateQuantity"
            class="cart-item-quantity"
          />
          <el-button type="danger" @click="removeItem">Remove</el-button>
        </div>
      </div>
    </el-card>
  </div>
</template>

<script lang="ts">
import { defineComponent, ref, watch } from 'vue';
import { useCartStore } from '@/stores/cart';

export default defineComponent({
  name: 'CartItem',
  props: {
    item: {
      type: Object,
      required: true,
    },
  },
  setup(props) {
    const cartStore = useCartStore();
    const quantity = ref(props.item.quantity);

    watch(quantity, (newQuantity) => {
      if (newQuantity <= 0) {
        cartStore.removeItem(props.item.id);
      }
    });

    const updateQuantity = () => {
      cartStore.updateItemQuantity(props.item.id, quantity.value);
    };

    const removeItem = () => {
      cartStore.removeItem(props.item.id);
    };

    return {
      quantity,
      updateQuantity,
      removeItem,
    };
  },
});
</script>

<style scoped>
.cart-item {
  margin-bottom: 16px;
}

.cart-item-content {
  display: flex;
  align-items: center;
}

.cart-item-image {
  width: 100px;
  height: 100px;
  object-fit: cover;
  margin-right: 16px;
}

.cart-item-title {
  font-size: 1.2em;
  margin: 0;
}

.cart-item-price {
  color: #f56c6c;
  font-weight: bold;
}

.cart-item-quantity {
  width: 100px;
  margin-right: 8px;
}
</style>