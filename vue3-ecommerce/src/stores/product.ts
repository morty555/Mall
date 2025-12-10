import { defineStore } from 'pinia';
import { ref } from 'vue';
import { productApi } from '../services/api/product';

export const useProductStore = defineStore('product', () => {
  const products = ref<any[]>([]);
  const productDetails = ref<any | null>(null);
  const loading = ref(false);
  const error = ref<string | null>(null);

  const fetchAllProducts = async (page = 1, limit = 10) => {
    loading.value = true;
    error.value = null;

    try {
      const response = await productApi.fetchProducts(page, limit);
      products.value = response.data; // ⭐ 这里取 data
    } catch (err) {
      error.value = (err as any)?.message || 'Failed to fetch products';
    } finally {
      loading.value = false;
    }
  };

  const fetchSingleProduct = async (id: string | number) => {
    loading.value = true;
    error.value = null;

    try {
      const response = await productApi.fetchProductById(id);
      productDetails.value = response.data; // ⭐ 这里也要 `.data`
    } catch (err) {
      error.value = (err as any)?.message || 'Failed to fetch product details';
    } finally {
      loading.value = false;
    }
  };

  const fetchFeaturedProducts = async () => {
    loading.value = true;
    error.value = null;

    try {
      const response = await productApi.fetchProducts(1, 10, { featured: true });
      products.value = response.data; // ⭐ 同样 data
      return response.data;
    } catch (err) {
      error.value = (err as any)?.message || 'Failed to fetch featured products';
      return [];
    } finally {
      loading.value = false;
    }
  };

  return {
    fetchAllProducts,
    fetchSingleProduct,
    fetchFeaturedProducts,

    products,
    productDetails,
    loading,
    error,
  };
});
