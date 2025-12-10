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
import { useUserStore } from '@/stores/user';
import { useRouter } from 'vue-router';
import { ElMessage } from 'element-plus';

export default defineComponent({
  setup() {
    const orderStore = useOrderStore();
    const cartStore = useCartStore();
    const userStore = useUserStore();
    const router = useRouter();
    
    const order = ref({
      recipient: '',
      address: '',
      phone: ''
    });

   const submitOrder = async () => {
  try {
    if (!userStore.isAuthenticated) {
      return ElMessage.warning('请先登录');
    }

    if (cartStore.items.length === 0) {
      return ElMessage.warning('购物车为空，无法提交订单');
    }

    if (!order.value.recipient || !order.value.address || !order.value.phone) {
      return ElMessage.warning('请填写完整的收货信息');
    }

    const requestBody = {
      userId: userStore.id,
      recipient: order.value.recipient,
      address: order.value.address,
      phone: order.value.phone,
      items: cartStore.items.map(item => ({
        productId: item.id,
        productName: item.name,
        price: item.price,
        quantity: item.quantity
      }))
    };
    console.log(requestBody.userId);
    const response = await fetch('/api/orders/create', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify(requestBody)
    });

    const result = await response.json();

    if (result.success) {
      ElMessage.success('订单提交成功！订单ID: ' + result.orderId);
      cartStore.clearCart();
      router.push('/orders');
    } else {
      ElMessage.error(result.message || '提交订单失败');
    }

  } catch (error) {
    console.error('提交订单失败:', error);
    ElMessage.error('提交订单异常，请稍后重试');
  }
};


    return { order, submitOrder };
  }
});
</script>

<style scoped>
.checkout {
  max-width: 600px;
  margin: 0 auto;
}
</style>