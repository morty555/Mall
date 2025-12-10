<template>
  <div class="product-list">
    <el-input
      v-model="searchQuery"
      placeholder="Search products"
      @input="onSearchChange"
      clearable
    />
    <el-select v-model="selectedCategory" @change="onCategoryChange" placeholder="Select category">
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
    const selectedCategory = ref<number | null>(null);
    const currentPage = ref(1);
    const pageSize = ref(10);
    const totalProducts = ref(0);
    const products = ref<any[]>([]);
    const categories = ref<any[]>([]); // 如果你有分类数据，可以在 mounted 里加载

    const fetchProducts = async () => {
      try {
        const response = await productStore.fetchProducts({
          search: searchQuery.value || undefined,
          categoryId: selectedCategory.value || undefined,
          page: currentPage.value,
          size: pageSize.value,
        });

        // 后端返回的结构：对象数组或者带分页对象
        // 假设后端返回 { data: [...], total: number }
        products.value = response.data || response; 
        totalProducts.value = response.total ?? products.value.length;
      } catch (error) {
        console.error('Failed to fetch products:', error);
      }
    };

    const handlePageChange = (page: number) => {
      currentPage.value = page;
      fetchProducts();
    };

    const onSearchChange = () => {
      currentPage.value = 1; // 搜索时重置到第一页
      fetchProducts();
    };

    const onCategoryChange = () => {
      currentPage.value = 1; // 分类改变时重置到第一页
      fetchProducts();
    };

    onMounted(() => {
      fetchProducts();
      // 如果你有分类接口，可以在这里加载 categories
      // categories.value = await productStore.fetchCategories();
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
      onSearchChange,
      onCategoryChange,
    };
  },
});
</script>

<style scoped>
.product-list {
  padding: 20px;
}
</style>
