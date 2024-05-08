import { createApp } from 'vue';
import App from './App.vue';
import router from './router';
import store from './store';
import ElementPlus from 'element-plus';
import 'element-plus/dist/index.css';

// 创建应用实例
const app = createApp(App);

// 设置反向代理，前端请求默认发送到 http://localhost:8443/api
import axios from 'axios';
axios.defaults.baseURL = 'http://localhost:8443/api';
// 将 Axios 实例添加到应用实例上
app.config.globalProperties.$axios = axios;

// 禁用生产提示
app.config.productionTip = false;

// 挂载 ElementPlus
app.use(ElementPlus);

// 路由守卫
router.beforeEach((to, from, next) => {
  if (to.meta.requireAuth) {
    if (store.state.user.username) {
      next();
    } else {
      next({
        path: 'login',
        query: { redirect: to.fullPath }
      });
    }
  } else {
    next();
  }
});

// 使用 store 和 router
app.use(store).use(router).mount('#app');