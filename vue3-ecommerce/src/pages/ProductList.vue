<template>
  <div class="product-list">
    <el-input
      v-model="searchQuery"
      placeholder="Search products"
      @input="onSearch"
      clearable
      style="width: 300px; margin-bottom: 20px;"
    />
    <el-select v-model="selectedCategory" @change="onFilterCategory" placeholder="Select category" style="margin-left: 20px;">
      <el-option
        v-for="category in categories"
        :key="category.id"
        :label="category.name"
        :value="category.id"
      />
    </el-select>

    <el-row :gutter="20" style="margin-top: 20px;">
      <el-col v-for="product in products" :key="product.id" :span="6">
        <ProductCard :product="product" />
      </el-col>
    </el-row>

    <!-- 分页 -->
    <el-pagination
      background
      layout="prev, pager, next"
      :page-size="pageSize"
      :current-page="currentPage"
      :total="totalProducts"
      @current-change="handlePageChange"
      style="margin-top: 20px; text-align: center;"
    />
  </div>
</template>

<script lang="ts">
import { defineComponent, ref, onMounted } from 'vue';
import ProductCard from '@/components/product/ProductCard.vue';
import { productApi } from '@/services/api/product'; // 你的 axios api 文件

export default defineComponent({
  components: { ProductCard },
  setup() {
    const searchQuery = ref('');
    const selectedCategory = ref<number | null>(null);
    const currentPage = ref(1);
    const pageSize = ref(10);
    const totalProducts = ref(0);
    const products = ref<any[]>([]);
    const categories = ref<{ id: number; name: string }[]>([
      { id: 1, name: 'Phone' },
      { id: 2, name: 'Laptop' },
      { id: 3, name: 'Tablet' },
      { id: 4, name: 'Accessory' },
    ]);

    const fetchProducts = async () => {
      try {
        const response = await productApi.fetchProducts(
          currentPage.value,
          pageSize.value,
          {
            search: searchQuery.value,
            category: selectedCategory.value,
          }
        );
        // 后端返回格式假设为 { data: [..], total: n }
        products.value = response.data;
        totalProducts.value = response.total;
      } catch (err) {
        console.error('Failed to fetch products', err);
      }
    };

    const handlePageChange = (page: number) => {
      currentPage.value = page;
      fetchProducts();
    };

    const onSearch = () => {
      currentPage.value = 1; // 搜索时回到第一页
      fetchProducts();
    };

    const onFilterCategory = () => {
      currentPage.value = 1; // 分类筛选时回到第一页
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
      categories,
      fetchProducts,
      handlePageChange,
      onSearch,
      onFilterCategory,
    };
  },
});
</script>

<style scoped>
.product-list {
  padding: 20px;
}
</style>
