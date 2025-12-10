<template>
  <div class="cart">
    <h1>购物车</h1>
    <el-table :data="cartItems" style="width: 100%">
      <el-table-column prop="product.name" label="商品" />
      <el-table-column prop="quantity" label="数量" />
      <el-table-column prop="product.price" label="单价" />
      <el-table-column label="总价">
        <template #default="scope">
          {{ scope.row.product.price * scope.row.quantity }}
        </template>
      </el-table-column>
      <el-table-column label="操作">
        <template #default="scope">
          <el-button @click="removeItem(scope.row.product.id)" type="danger">删除</el-button>
        </template>
      </el-table-column>
    </el-table>
    <div class="total">
      <h2>总价: {{ totalPrice }}</h2>
      <el-button type="primary" @click="checkout">去结算</el-button>
    </div>
  </div>
</template>

<script lang="ts">
import { defineComponent, computed } from 'vue';
import { useCartStore } from '@/stores/cart';

export default defineComponent({
  setup() {
    const cartStore = useCartStore();
    
    const totalPrice = computed(() => {
      return cartStore.cartItems.reduce((total, item) => {
        return total + item.product.price * item.quantity;
      }, 0);
    });

    const removeItem = (productId: number) => {
      cartStore.removeItem(productId);
    };

    const checkout = () => {
      // Navigate to checkout page
      // this.$router.push('/checkout');
    };

    return {
      cartItems: cartStore.cartItems,
      totalPrice,
      removeItem,
      checkout,
    };
  },
});
</script>

<style scoped>
.cart {
  padding: 20px;
}

.total {
  margin-top: 20px;
}
</style>