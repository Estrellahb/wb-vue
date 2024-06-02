<template>
    <el-menu
      :default-active="'/index'"
      router
      mode="horizontal"
      background-color="white"
      text-color="#222"
      active-text-color="red"
      style="min-width: 1300px">
      <el-menu-item v-for="(item, index) in navList" :key="index" :index="item.name">
        {{ item.navItem }}
      </el-menu-item>
      <!-- <a href="#nowhere" style="color: #222; float: right; padding: 20px;">更多功能</a> -->
      <i class="el-icon-menu" style="float: right; font-size: 45px; color: #222; padding-top: 8px"></i>
      <span style="position: absolute; padding-top: 20px; right: 43%; font-size: 20px; font-weight: bold">陆秋的小站</span>
    </el-menu>
  </template>
  
  <script>
  export default {
    name: 'NavMenu',
    setup() {
      const navList = [
        { name: '/index', navItem: '首页' },
        { name: '/anime', navItem: '番剧信息' },
        { name: '/library', navItem: '图书馆' },
        { name: '/admin', navItem: '个人中心' },
        { name: '/website', navItem: '网站导航' },
      ];
  
      return {
        navList,
      };
    },
  };
  </script>
  
  <style scoped>
  a {
    text-decoration: none;
  }
  
  span {
    pointer-events: none;
  }
  </style>