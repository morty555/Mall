<template>
  <div class="checkout">
    <h1>Checkout</h1>
    <el-form :model="order" ref="orderForm" label-width="120px">
      <el-form-item label="收货人">
        <el-input v-model="order.recipient" placeholder="请输入收货人姓名"></el-input>
      </el-form-item>
      <el-form-item label="地址">
        <el-input v-model="order.address" placeholder="请输入收货地址"></el-input>
      </el-form-item>
      <el-form-item label="电话">
        <el-input v-model="order.phone" placeholder="请输入联系电话"></el-input>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" @click="submitOrder">提交订单</el-button>
      </el-form-item>
    </el-form>
  </div>
</template>

<script lang="ts">
import { defineComponent, ref } from 'vue';
import { useOrderStore } from '@/stores/order';
import { useCartStore } from '@/stores/cart';
import { useRouter } from 'vue-router';

export default defineComponent({
  setup() {
    const orderStore = useOrderStore();
    const cartStore = useCartStore();
    const router = useRouter();
    
    const order = ref({
      recipient: '',
      address: '',
      phone: ''
    });

    const submitOrder = async () => {
      try {
        await orderStore.submitOrder(order.value);
        cartStore.clearCart();
        router.push('/orders');
      } catch (error) {
        console.error('提交订单失败:', error);
      }
    };

    return {
      order,
      submitOrder
    };
  }
});
</script>

<style scoped>
.checkout {
  max-width: 600px;
  margin: 0 auto;
}
</style>