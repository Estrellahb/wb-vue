<template>
  <div class="background"></div>
  <el-container class="container">
    
    <el-aside class="sidebar" width="20%">
      <el-avatar :size="100" class="picture" :src="avatarSrc"></el-avatar>
      <div class="name">
        <el-divider content-position="center">陆秋</el-divider>
      </div>
      <div class="list">
        <el-card>
          <template #header>
            <div class="clearfix">
              <span>按时间分类</span>
            </div>
          </template>
          <ul>
            <li>
              <el-tag type="success" effect="dark" size="large">连载中</el-tag>
            </li>
            <li>
              <el-tag type="info" effect="dark" size="large" class="completed-tag">已完结</el-tag>
            </li>
          </ul>
        </el-card>
      </div>
    </el-aside>
    <el-main class="content">
      <!-- 模糊搜索组件 -->
      <anime-search
        @search="handleSearch"
      />

      
      <!-- 动画详情组件 -->
      <div class="anime-list">
        <anime-detail
          v-for="anime in animeList"
          :key="anime.id"
          :animeId="anime.id"
          :animeNameCN="anime.name_cn"
          :animeNameJP="anime.name_jp"
          :animeState="anime.state"
          :modelValue="anime.value"
          :animeInfo="anime.info"
        />
      </div>
    </el-main>
  </el-container>
</template>

<script>
import { ref , onMounted} from 'vue';
import { ElContainer, ElAside, ElMain, ElAvatar, ElDivider, ElCard, ElTag, ElRate, ElInput, ElButton,ElMessage } from 'element-plus';
import AnimeDetail from './AnimeDetail.vue';
import axios from 'axios';
import AnimeSearch from './animeSearch.vue';

export default {
  name: 'AnimeIndex',
  components: {
    ElContainer, ElAside, ElMain, ElAvatar, ElDivider, ElCard, ElTag, ElRate, ElInput, ElButton
    ,AnimeDetail,AnimeSearch
  },
  setup() {
    // 通过 ES6 模块导入语法导入图片资源
    const avatarSrc = require('@/assets/虹夏.png');
    
    //番剧详细信息
        const animeList = ref([]);

    const fetchAnimeList = async () => {
      try {
        const response = await axios.get('/anime/all');  // 修改为你的后端API端点
        animeList.value = response.data;
      } catch (error) {
        console.error('Error fetching anime list:', error);
      }
    };

    const handleSearch = async (query) => {
      try {
        // 发送搜索请求到后端，并传递搜索查询参数
        const response = await axios.get(`anime/search?nameCn=${query}`);
        animeList.value = response.data;
      } catch (error) {
        ElMessage.error('没找到，请检查名字是否正确');
        console.error('搜索失败:', error);
      }
    };
    
    onMounted(() => {
      fetchAnimeList();
    });
    
    return {
      avatarSrc,
      animeList,
      handleSearch
    }
  }
}
</script>


<style scoped>
.content {
  padding: 0;
  overflow-y: hidden; /* 隐藏垂直滚动条 */
  height: 100%; /* 让内容适应容器的高度 */
  margin-right: 10px;
}


.background{
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-image: url("@/assets/朱_54341472.jpg");
  background-size: cover;
  background-position: center;
  opacity: 0.8;
  z-index: -3;
}
.container {
  padding-top: 50px;
  margin-left: 10%;
  margin-right: 10%;
  background-color: rgba(255, 255, 255, 0.9); 
  border: none; /* 移除边框 */
  overflow: hidden;
}

.sidebar {
  padding: 10px;
}

.sidebar .picture {
  margin-bottom: 10px;
}

.sidebar .name {
  margin-bottom: 20px;
}

.sidebar .list {
  margin-top: 20px;
}

.sidebar .list ul {
  list-style-type: none;
  margin-left: 0;
  padding-left: 0px;
}

.sidebar .list ul li {
  margin-bottom: 10px; /* Add space between the tags */
}


</style>
