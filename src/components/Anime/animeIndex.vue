<template>
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
      <div class="search">
        <el-input v-model="searchQuery" placeholder="请输入动画名称"></el-input>
        <el-button @click="searchAnime" type="primary">搜索</el-button>
      </div>
      <!-- 动画详情组件 -->
      <div>
        <anime-detail
          :url="animeImageUrl"
          :animeNameCN="animeNameCN"
          :animeNameJP="animeNameJP"
          :animeState="animeState"
          :modelValue="animeRating"
          :animeInfo="animeInfo"
        />
      </div>
    </el-main>
  </el-container>
</template>

<script>
import { ref } from 'vue';
import { ElContainer, ElAside, ElMain, ElAvatar, ElDivider, ElCard, ElTag, ElRate, ElInput, ElButton } from 'element-plus';
import AnimeDetail from './AnimeDetail.vue';
export default {
  name: 'AnimeIndex',
  components: {
    ElContainer, ElAside, ElMain, ElAvatar, ElDivider, ElCard, ElTag, ElRate, ElInput, ElButton
    ,AnimeDetail
  },
  setup() {
    const searchQuery = ref('');
    
    // 通过 ES6 模块导入语法导入图片资源
    const avatarSrc = require('@/assets/虹夏.png');
    
    const searchAnime = () => {
      console.log('搜索内容:', searchQuery.value);
      // 实现搜索逻辑
    }
    //番剧详细信息
    const animeImageUrl = require('@/assets/19a4de9cdaa68a2136af784f87dfabab512995925.jpg');
    const animeNameCN = ref('GIRLS BAND CRY');
    const animeNameJP = ref('ガールズバンドクライ');
    const animeState = ref('连载中');
    const animeRating = ref(4.9);
    const animeInfo = ref('番剧简介：高中二年级时退学，独自一人以上大学为目标前往东京的主角。 被朋友背叛不知道该怎么办的少女。 被父母抛弃，在大城市中独自打工维持生计的女孩。 这个世界总是背叛我们。 什么事情都不会按照我们的意愿发展。 但是，因为我们有热爱着的事物。 因为我们相信有属于自己的容身之处。 所以、高歌着。');

 
    return {
      searchQuery,
      avatarSrc,
      searchAnime,
      animeImageUrl,
      animeNameCN,
      animeNameJP,
      animeRating,
      animeInfo,
      animeState
    }
  }
}
</script>


<style scoped>
.container {
  margin-top: 50px;
  margin-left: 10%;
  margin-right: 10%;
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

.content {
  padding: 10px;
}

.search {
  display: flex;
  margin-bottom: 20px;
}

.search .el-input {
  margin-right: 10px;
  margin-left: 10%;
  width: 80%;
}


</style>
