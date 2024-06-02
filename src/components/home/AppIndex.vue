<template>
  <div class="background"></div>
  <el-container class="container">
    
    <el-header>
      <!-- 头部内容 -->
    </el-header>
    <el-container>
      <el-aside width="300px">
        <el-card>
          <div slot="header">个人简介</div>
          <div>这里是个人简介内容</div>
        </el-card>
        <el-card>
          <div slot="header">文章分类</div>
          <el-menu>
            <el-menu-item index="1">前端</el-menu-item>
            <el-menu-item index="2">后端</el-menu-item>
            <el-menu-item index="3">其他</el-menu-item>
          </el-menu>
        </el-card>
      </el-aside>
      <el-main>
        <el-row :gutter="20">
          <el-col :span="24" v-for="article in articles" :key="article.id">
            <el-card>
              <h3>{{ article.title }}</h3>
              <p>{{ article.summary }}</p>
              <p>{{ article.date }}</p>
            </el-card>
          </el-col>
        </el-row>
      </el-main>
    </el-container>
    <div class="aplayer-wrap">
      <div id="aplayer"></div>
    </div>
    <!-- <el-footer>版权所有 © 2024</el-footer> -->
  </el-container>
  
  
</template>

<script>
import { ref } from 'vue';
import 'aplayer/dist/APlayer.min.css';
import aplayer from 'aplayer';

export default {
  name: 'AppIndex',
  setup() {
    const articles = ref([
      {
        id: 1,
        title: '第一篇文章',
        summary: '这是第一篇文章的简介',
        date: '2024-01-01'
      },
      {
        id: 2,
        title: '第二篇文章',
        summary: '这是第二篇文章的简介',
        date: '2024-01-02'
      },
      // 更多文章...
    ]);

    return {
      articles
    };
  },
  mounted() {
    const ap = new aplayer({
      container: document.getElementById('aplayer'),
      mini: false,
      autoplay: false,
      theme: '#FADFA3',
      loop: 'all',
      order: 'random',
      volume: 0.5,
      audio: [{
        name: '星座になれたら',
        artist: '結束バンド',
        url: 'music/星座.flac',
        cover: 'music/结束乐队.png',
        lrc: 'lrc.lrc',
        theme: '#ebd0c2'
      }]
    });
  }
};
</script>

<style>
  .aplayer-wrap {
    max-width: 500px;
    margin: 1.3em 10px;
    
}
  .container{
    margin: 0 5%;
    background-color: rgba(255, 255, 255, 0.9);
    height: 100%;
  }
  .background{
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-image: url("@/assets/梦鲸落_76900523.jpg");
  background-size: cover;
  background-position: center;
  opacity: 0.8;
  z-index: -3;
}
</style>
