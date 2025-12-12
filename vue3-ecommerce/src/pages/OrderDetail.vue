<template>
  <div class="order-detail">
    <el-card>
      <h2>订单详情</h2>
      <div v-if="order">
        <el-row :gutter="20">
          <el-col :span="12">
            <h3>订单号: {{ order.id }}</h3>
            <p>状态: {{ order.status }}</p>
            <p>总价: {{ order.totalPrice }} 元</p>
            <p>创建时间: {{ order.createdAt }}</p>
          </el-col>
          <el-col :span="12">
            <h3>收货信息</h3>
            <p>电话: {{ order.phone || 'N/A' }}</p>
            <p>地址: {{ order.address || 'N/A' }}</p>
          </el-col>
        </el-row>

        <el-divider>商品列表</el-divider>

        <el-table :data="order.items" style="width: 100%">
          <el-table-column prop="productName" label="商品" />
          <el-table-column prop="quantity" label="数量" />
          <el-table-column prop="price" label="单价" />
        </el-table>
      </div>
      <div v-else-if="orderStore.loading">
        <p>订单数据加载中...</p>
      </div>
      <div v-else>
        <p>订单信息为空或订单列表尚未加载。请确认订单 ID 是否正确。</p>
        <el-button @click="orderStore.fetchOrderHistory()">重新加载订单列表</el-button>
      </div>
    </el-card>
  </div>
</template>

<script lang="ts">
import { defineComponent, onMounted, computed } from 'vue';
import { useOrderStore } from '@/stores/order';
import { useRoute } from 'vue-router';
import { storeToRefs } from 'pinia';

export default defineComponent({
  setup() {
    const route = useRoute();
    const orderStore = useOrderStore();
    
    // 确保 orders 列表是响应式的
    // 同时获取 loading 状态，用于显示“加载中”
    const { orders, loading } = storeToRefs(orderStore);
console.log('路由参数:', route.params); 
    console.log('订单 ID (route.params.orderId):', route.params.orderId);
    // 从路由中获取 ID，并转换为数字
   const orderId = computed(() => Number(route.params.id));
    
    // 使用 computed 属性实时从 orders 列表中查找当前订单
    const order = computed(() => {
        // 在 orders 数组中查找匹配 ID 的订单
        return orders.value.find(o => o.id === orderId.value) || null;
    });

    onMounted(async () => {
        // 如果 orders 列表尚未加载（或为空），则发起列表请求
        // 确保直接通过 URL 访问详情页时数据也能加载
        if (orders.value.length === 0 && !loading.value) {
            await orderStore.fetchOrderHistory();
        }
    });

    return {
      order,
      orderStore, // 暴露整个 store 以便访问 loading 和 fetchOrderHistory
    };
  },
});
</script>

<style scoped>
.order-detail {
  padding: 20px;
}
.el-row {
  margin-bottom: 20px;
}
</style>