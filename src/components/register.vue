<template>
    <body id="poster">
      <el-form class="register-container" label-position="left" label-width="0px">
        <h3 class="login_title">系统注册</h3>
        <el-form-item>
          <el-input type="text" v-model="username" auto-complete="off" placeholder="账号"></el-input>
        </el-form-item>
        <el-form-item>
          <el-input type="password" v-model="password" auto-complete="off" placeholder="密码"></el-input>
        </el-form-item>
        <el-form-item>
          <el-input type="password" v-model="confirmPassword" auto-complete="off" placeholder="确认密码"></el-input>
        </el-form-item>
        <el-form-item style="width: 100%">
          <el-button type="primary" style="width: 100%;background: #007FFF;border: none" v-on:click="register">注册</el-button>
        </el-form-item>
      </el-form>
    </body>
  </template>
  
  <script>
import axios from 'axios';
import { MessageBox,ElMessage} from 'element-plus';
export default {
  name: 'Register',
  data() {
    return {
      username: '',
      password: '',
      confirmPassword: ''
    };
  },
  methods: {
    register() {
      if (this.password !== this.confirmPassword) {
        ElMessage.error('密码和确认密码不匹配');
        console.error('密码和确认密码不匹配');
        return;
      }

      axios.post('/register', {
        username: this.username,
        password: this.password
      })
      .then(response => {
        if (response.data.code === 200) {
            
            // 注册成功，显示 Toast 提示
          ElMessage.success('注册成功');
            // 点击确定按钮后跳转到登录页面
            this.$router.push('/login');
            
        } else {
            ElMessage.success('已注册请登录');
            console.error('注册失败');
        }
        })
      .catch(error => {
        console.error('注册失败:', error);
      });
    }
  }
};
</script>
  <style>
  .register-container {
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
  