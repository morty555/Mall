<template>
  <div class="orders">
    <h1>我的订单</h1>
    <el-table :data="orders" style="width: 100%">
      <el-table-column prop="id" label="订单号" />
      <el-table-column prop="createdAt" label="创建时间" />
      <el-table-column prop="totalPrice" label="总金额" />
      <el-table-column label="状态">
        <template #default="scope">
          <el-tag :type="getStatusType(scope.row.status)">
            {{ scope.row.status }}
          </el-tag>
        </template>
      </el-table-column>
      <el-table-column label="操作">
        <template #default="scope">
          <el-button @click="viewOrderDetail(scope.row.id)" type="text">查看</el-button>
        </template>
      </el-table-column>
    </el-table>
  </div>
</template>

<script lang="ts">
import { defineComponent, onMounted } from 'vue';
import { useOrderStore } from '@/stores/order';
import { storeToRefs } from 'pinia';
import { useRouter } from 'vue-router';

export default defineComponent({
  setup() {
    const router = useRouter();
    const orderStore = useOrderStore();

    // 必须使用 storeToRefs，否则不响应
    const { orders } = storeToRefs(orderStore);

    const fetchOrders = async () => {
      await orderStore.fetchOrderHistory();
    };

    const viewOrderDetail = (orderId: number) => {
      router.push(`/orders/${orderId}`);
    };

    // 考虑到您的后端状态是 "pending" 等英文，这里进行了兼容性修改
    const getStatusType = (status: string) => {
      switch (status) {
        case 'pending': // 兼容后端返回的 "pending"
        case '待发货':
          return 'warning';
        case 'shipped': // 兼容可能的 "shipped"
        case '已发货':
          return 'success';
        case 'cancelled': // 兼容可能的 "cancelled"
        case '已取消':
          return 'danger';
        default:
          return 'info';
      }
    };

    onMounted(fetchOrders);

    return {
      orders,
      viewOrderDetail,
      getStatusType,
    };
  },
});
</script>

<style scoped>
/* 可以在这里添加您的样式 */
</style>