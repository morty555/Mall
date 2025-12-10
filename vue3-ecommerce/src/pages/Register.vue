<template>
  <div class="register">
    <el-form :model="form" ref="formRef" label-width="120px" @submit.native.prevent="handleSubmit">
      <el-form-item label="用户名" prop="username" :rules="[{ required: true, message: '请输入用户名', trigger: 'blur' }]">
        <el-input v-model="form.username" placeholder="请输入用户名"></el-input>
      </el-form-item>
      <el-form-item label="邮箱" prop="email" :rules="[{ required: true, message: '请输入邮箱', trigger: 'blur' }, { type: 'email', message: '邮箱格式不正确', trigger: ['blur', 'change'] }]">
        <el-input v-model="form.email" placeholder="请输入邮箱"></el-input>
      </el-form-item>
      <el-form-item label="密码" prop="password" :rules="[{ required: true, message: '请输入密码', trigger: 'blur' }]">
        <el-input v-model="form.password" type="password" placeholder="请输入密码"></el-input>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" @click="handleSubmit">注册</el-button>
        <el-button @click="$router.push('/login')">已有账号？去登录</el-button>
      </el-form-item>
    </el-form>
  </div>
</template>

<script lang="ts">
import { defineComponent, ref } from 'vue';
import { useUserStore } from '@/stores/user';
import { useRouter } from 'vue-router';

export default defineComponent({
  setup() {
    const form = ref({
      username: '',
      email: '',
      password: '',
    });
    const formRef = ref(null);
    const userStore = useUserStore();
    const router = useRouter();

    const handleSubmit = async () => {
      if (formRef.value) {
        const isValid = await formRef.value.validate();
        if (isValid) {
          try {
            await userStore.register(form.value);
            router.push('/login');
          } catch (error) {
            console.error('注册失败:', error);
          }
        }
      }
    };

    return {
      form,
      formRef,
      handleSubmit,
    };
  },
});
</script>

<style scoped>
.register {
  max-width: 400px;
  margin: 0 auto;
}
</style>