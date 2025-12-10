<template>
  <div class="orders">
    <h1>我的订单</h1>
    <el-table :data="orders" style="width: 100%">
      <el-table-column prop="id" label="订单号" />
      <el-table-column prop="createdAt" label="创建时间" />
      <el-table-column prop="total" label="总金额" />
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

export default defineComponent({
  setup() {
    const orderStore = useOrderStore();
    const orders = orderStore.orders;

    const fetchOrders = async () => {
      await orderStore.fetchOrders();
    };

    const viewOrderDetail = (orderId: number) => {
      // 跳转到订单详情页面
      // 这里可以使用 Vue Router 进行页面跳转
    };

    const getStatusType = (status: string) => {
      switch (status) {
        case '待发货':
          return 'warning';
        case '已发货':
          return 'success';
        case '已取消':
          return 'danger';
        default:
          return 'info';
      }
    };

    onMounted(() => {
      fetchOrders();
    });

    return {
      orders,
      viewOrderDetail,
      getStatusType,
    };
  },
});
</script>

<style scoped>
.orders {
  padding: 20px;
}
</style>