<template>
    <div class="search">
      <el-input v-model="searchQuery" placeholder="请输入动画名称"></el-input>
      <el-button @click="searchAnime" type="primary">搜索</el-button>
    </div>
  </template>
  
  <script>
  export default {
    data() {
      return {
        searchQuery: '' // 绑定输入框中的搜索查询
      };
    },
    methods: {
      searchAnime() {
        // 调用父组件传递的搜索方法，并传递搜索查询
        this.$emit('search', this.searchQuery);
      }
    }
  };
  </script>
  
  <style scoped>
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