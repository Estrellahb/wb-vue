<template>
  <body id="poster">
  <el-form class="login-container" label-position="left"
           label-width="0px">
    <h3 class="login_title">系统登录</h3>
    <el-form-item>
      <el-input type="text" v-model="loginForm.username"
                auto-complete="off" placeholder="账号"></el-input>
    </el-form-item>
    <el-form-item>
      <el-input type="password" v-model="loginForm.password"
                auto-complete="off" placeholder="密码"></el-input>
    </el-form-item>
    <el-form-item style="width: 100%">
      <el-button type="primary" style="width: 100%;background: #505458;border: none" v-on:click="login">登录</el-button>
    </el-form-item>
  </el-form>
</body>
</template>




<script>
import { ref } from "vue";
import axios from 'axios';
import { useStore } from 'vuex';
import { useRouter } from 'vue-router'; // 导入 useRouter 方法

export default {
    name: 'Login',
    setup(){
        const loginForm = ref({
      username: '',
      password: ''
    });
    const responseResult = ref([]);
    const store = useStore();
    const router = useRouter();
  

    const login = () => {
      console.log(store.state);
      axios.post('/login', { // 使用 axios 发送 POST 请求
        username: loginForm.value.username,
        password: loginForm.value.password
      })
      .then(successResponse => {
        if (successResponse.data.code === 200) {
          store.commit('login', loginForm.value);
          const path = router.currentRoute.value.query.redirect || '/index';
          router.replace({ path });
        }
      })
      .catch(failResponse => {
        // 处理失败情况
      });
    };

    return {
      loginForm,
      responseResult,
      login
    }; // 返回需要暴露的数据和方法
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
    background:url("../assets/星眠.png") no-repeat center;
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