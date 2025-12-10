<template>
  <div class="pagination">
    <el-pagination
      :current-page="currentPage"
      :page-size="pageSize"
      :total="totalItems"
      @current-change="handlePageChange"
      layout="total, prev, pager, next, jumper"
    />
  </div>
</template>

<script lang="ts" setup>
import { ref, watch } from 'vue';

const props = defineProps<{
  totalItems: number;
  pageSize: number;
  modelValue: number;
}>();

const emit = defineEmits<{
  (e: 'update:modelValue', value: number): void;
}>();

const currentPage = ref(props.modelValue);

watch(() => props.modelValue, (newValue) => {
  currentPage.value = newValue;
});

const handlePageChange = (page: number) => {
  currentPage.value = page;
  emit('update:modelValue', page);
};
</script>

<style scoped>
.pagination {
  display: flex;
  justify-content: center;
  margin: 20px 0;
}
</style>
