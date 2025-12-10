<template>
  <div class="product-list">
    <el-input
      v-model="searchQuery"
      placeholder="Search products"
      @input="fetchProducts"
      clearable
    />
    <el-select v-model="selectedCategory" @change="fetchProducts" placeholder="Select category">
      <el-option
        v-for="category in categories"
        :key="category.id"
        :label="category.name"
        :value="category.id"
      />
    </el-select>
    <el-row :gutter="20">
      <el-col v-for="product in products" :key="product.id" :span="6">
        <ProductCard :product="product" />
      </el-col>
    </el-row>
    <Pagination
      :current-page="currentPage"
      :page-size="pageSize"
      :total="totalProducts"
      @current-change="handlePageChange"
    />
  </div>
</template>

<script lang="ts">
import { defineComponent, ref, onMounted } from 'vue';
import { useProductStore } from '@/stores/product';
import ProductCard from '@/components/product/ProductCard.vue';
import Pagination from '@/components/common/Pagination.vue';

export default defineComponent({
  components: {
    ProductCard,
    Pagination,
  },
  setup() {
    const productStore = useProductStore();
    const searchQuery = ref('');
    const selectedCategory = ref(null);
    const currentPage = ref(1);
    const pageSize = ref(10);
    const totalProducts = ref(0);
    const products = ref([]);

    const fetchProducts = async () => {
      const response = await productStore.fetchProducts({
        search: searchQuery.value,
        category: selectedCategory.value,
        page: currentPage.value,
        size: pageSize.value,
      });
      products.value = response.data;
      totalProducts.value = response.total;
    };

    const handlePageChange = (page: number) => {
      currentPage.value = page;
      fetchProducts();
    };

    onMounted(() => {
      fetchProducts();
    });

    return {
      searchQuery,
      selectedCategory,
      currentPage,
      pageSize,
      totalProducts,
      products,
      fetchProducts,
      handlePageChange,
    };
  },
});
</script>

<style scoped>
.product-list {
  padding: 20px;
}
</style>