<template>
  <body id="poster">
    <el-form class="login-container" label-position="left" label-width="0px">
      <h3 class="login_title">系统登录</h3>
      <el-form-item>
        <el-input type="text" v-model="loginForm.username" auto-complete="off" placeholder="账号"></el-input>
      </el-form-item>
      <el-form-item>
        <el-input type="password" v-model="loginForm.password" auto-complete="off" placeholder="密码"></el-input>
      </el-form-item>
      <el-form-item style="width: 100%">
        <el-button type="primary" style="width: 48%; background: #505458; border: none" v-on:click="login">登录</el-button>
        <el-button type="primary" style="width: 48%; background: #007FFF; border: none" v-on:click="register">注册</el-button>
      </el-form-item>
    </el-form>
  </body>
</template>

<script>
import { ref } from "vue";
import axios from 'axios';
import { useStore } from 'vuex';
import { useRouter } from 'vue-router';
import { ElMessage } from 'element-plus';

export default {
  name: 'Login',
  setup() {
    const loginForm = ref({
      username: '',
      password: ''
    });
    const store = useStore();
    const router = useRouter();

    const login = () => {
      console.log("Attempting login with username:", loginForm.value.username);

      axios.post('/login', {
        username: loginForm.value.username,
        password: loginForm.value.password
      })
      .then(successResponse => {
        if (successResponse.data.code === 200) {
          store.commit('login', loginForm.value);
          const path = router.currentRoute.value.query.redirect || '/index';
          router.replace({ path });
        } else {
          ElMessage.error('登录失败，请稍后重试');
          console.error('登录失败:', successResponse.data.code);
        }
      })
      .catch(failResponse => {
        let errorMessage = '登录失败，请稍后重试';
        if (failResponse.response) {
          const status = failResponse.response.status;
          errorMessage = status === 400 ? '用户不存在，请注册' : errorMessage;
          console.error('登录失败:', status);
        } else {
          console.error('登录失败:', failResponse);
        }
        ElMessage.error(errorMessage);
      });
    }


    const register = () => {
      router.push('/register');
    };

    return {
      loginForm,
      login,
      register
    };
  }
}
</script>

<style>
.login-container {
  border-radius: 15px;
  background-clip: padding-box;
  margin: 90px auto;
  width: 350px;
  padding: 35px 35px 15px 35px;
  background: #fff;
  border: 1px solid #eaeaea;
  box-shadow: 0 0 25px #cac6c6;
}

.login_title {
  margin: 0px auto 40px auto;
  text-align: center;
  color: #505458;
}

#poster {
  background: url("../assets/星眠.png") no-repeat center;
  height: 100%;
  width: 100%;
  background-size: cover;
  position: fixed;
}

body {
  height: 100%;
  margin: 0;
}
</style>
