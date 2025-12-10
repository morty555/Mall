<template>
  <div class="order-detail">
    <el-card>
      <h2>订单详情</h2>
      <div v-if="order">
        <el-row>
          <el-col :span="12">
            <h3>订单号: {{ order.id }}</h3>
            <p>状态: {{ order.status }}</p>
            <p>总价: {{ order.totalPrice }} 元</p>
            <p>创建时间: {{ order.createdAt }}</p>
          </el-col>
          <el-col :span="12">
            <h3>收货信息</h3>
            <p>收货人: {{ order.shippingAddress.name }}</p>
            <p>电话: {{ order.shippingAddress.phone }}</p>
            <p>地址: {{ order.shippingAddress.address }}</p>
          </el-col>
        </el-row>
        <el-table :data="order.items" style="width: 100%">
          <el-table-column prop="product.name" label="商品" />
          <el-table-column prop="quantity" label="数量" />
          <el-table-column prop="price" label="单价" />
        </el-table>
      </div>
      <div v-else>
        <p>加载中...</p>
      </div>
    </el-card>
  </div>
</template>

<script lang="ts">
import { defineComponent, onMounted } from 'vue';
import { useOrderStore } from '@/stores/order';

export default defineComponent({
  setup() {
    const orderStore = useOrderStore();
    const orderId = '12345'; // Replace with dynamic order ID as needed
    const order = orderStore.getOrder(orderId);

    onMounted(async () => {
      if (!order) {
        await orderStore.fetchOrder(orderId);
      }
    });

    return {
      order,
    };
  },
});
</script>

<style scoped>
.order-detail {
  padding: 20px;
}
</style>