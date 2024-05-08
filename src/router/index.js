import { createRouter, createWebHistory } from 'vue-router'; // 导入 createWebHashHistory 函数
import Login from '../components/Login.vue';
import AppIndex from '../components/home/AppIndex.vue';
import Home from '../components/Home.vue'

const router = createRouter({
  history: createWebHistory(), // 使用 History 创建路由器实例
  routes: [
    {
      path: '/home',
      name: 'Home',
      component: Home,
      redirect: '/index',
      children: [
        {
          path: '/index',
          name: 'AppIndex',
          component: AppIndex,
          meta: {
            requireAuth: true
          }
        }
      ]
    },
    {
      path: '/login',
      name: 'Login',
      component: Login
    }
  ]
});

export default router;
