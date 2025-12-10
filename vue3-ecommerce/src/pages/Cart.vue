<template>
  <div class="cart">
    <h1>购物车</h1>
    <el-table :data="cartItems" style="width: 100%">
      <el-table-column prop="name" label="商品" />
      <el-table-column prop="quantity" label="数量" />
      <el-table-column prop="price" label="单价" />
      <el-table-column label="总价">
        <template #default="scope">
          {{ (scope.row.price * scope.row.quantity).toFixed(2) }}
        </template>
      </el-table-column>
      <el-table-column label="操作">
        <template #default="scope">
          <el-button @click="removeItem(scope.row.id)" type="danger">删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <div class="total">
      <h2>总价: ${{ totalPrice.toFixed(2) }}</h2>
      <el-button type="primary" @click="checkout">去结算</el-button>
    </div>
  </div>
</template>

<script lang="ts">
import { defineComponent, computed } from 'vue';
import { useCartStore } from '@/stores/cart';
import { useRouter } from 'vue-router';
import { ElMessage } from 'element-plus';

export default defineComponent({
  setup() {
    const cartStore = useCartStore();
    const router = useRouter();

    // 购物车列表
    const cartItems = computed(() => cartStore.items);

    // 购物车总价
    const totalPrice = computed(() =>
      cartStore.items.reduce((sum, item) => sum + item.price * item.quantity, 0)
    );

    // 删除商品
    const removeItem = (id: number) => {
      const item = cartStore.items.find(i => i.id === id);
      cartStore.removeItem(id);

      if (item) {
        ElMessage({
          message: `${item.name} 已从购物车移除`,
          type: 'warning',
          duration: 1500,
        });
      }
    };

    // 去结算
    const checkout = () => {
      router.push('/checkout');
    };

    return {
      cartItems,
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
  text-align: right;
}
</style>
