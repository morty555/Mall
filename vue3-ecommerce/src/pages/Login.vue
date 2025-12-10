<template>
  <div class="login-container">
    <el-form :model="form" ref="formRef" label-width="100px" @submit.native.prevent="handleLogin">
      <el-form-item label="邮箱" prop="email">
        <el-input v-model="form.email" placeholder="请输入邮箱"></el-input>
      </el-form-item>
      <el-form-item label="密码" prop="password">
        <el-input type="password" v-model="form.password" placeholder="请输入密码"></el-input>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" @click="handleLogin">登录</el-button>
        <el-button @click="goToRegister">注册</el-button>
      </el-form-item>
    </el-form>
  </div>
</template>

<script lang="ts">
import { defineComponent, ref } from 'vue';
import { useRouter } from 'vue-router';
import { useUserStore } from '@/stores/user';
import { ElMessage } from 'element-plus';

export default defineComponent({
  setup() {
    const router = useRouter();
    const userStore = useUserStore();
    const form = ref({
      email: '',
      password: ''
    });

    const handleLogin = async () => {
      try {
        await userStore.login(form.value);
        
        // 登录成功提示
        ElMessage.success('登录成功，欢迎回来！');

        router.push('/'); 
      } catch (error) {
        console.error('登录失败:', error);

        // 登录失败提示
        ElMessage.error('登录失败，请检查账号或密码');
      }
    };

    const goToRegister = () => {
      router.push('/register');
    };

    return {
      form,
      handleLogin,
      goToRegister
    };
  }
});
</script>


<style scoped>
.login-container {
  max-width: 400px;
  margin: 100px auto;
}
</style>