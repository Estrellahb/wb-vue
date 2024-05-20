import { createRouter, createWebHistory } from 'vue-router'; // 导入 createWebHashHistory 函数
import Login from '../components/Login.vue';
import AppIndex from '../components/home/AppIndex.vue';
import Home from '../components/Home.vue'
import LibraryIndex from '../components/Library/LibraryIndex.vue'
import { VideoPlayer } from 'vue-video-player';
import animeIndex from '@/components/Anime/animeIndex.vue';

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
        },
        {
          path: '/library',
        name: 'Library',
        component: LibraryIndex,
        meta: {
          requireAuth: true
        }
          
        },
        {
          path :'/anime',
          name: animeIndex,
          component: animeIndex,
          
        }
      ]
    },
    {
      path: '/login',
      name: 'Login',
      component: Login,
    },
    {
      path: '/video',
      name:'Video',
      component: VideoPlayer
    }
  ]
});

export default router;
