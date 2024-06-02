<template>
  <!-- <nav>
    <router-link to="/">Home</router-link> |
    <router-link to="/about">About</router-link>
  </nav> <nav> 中的内容都会显示在所有页面的顶部-->
  <router-view/>
</template>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #000000;
  
}


</style>
<script>
export default {
  data() {
    return {
      originalTitle: '你好呀( ° ∀ ° )ﾉﾞ',//你的原始标题
      hiddenTitle: '看不见我(*/ω＼*)'//你离开时的标题
    };
  },
  mounted() {
    document.title = this.originalTitle;
    document.addEventListener('visibilitychange', this.handleVisibilityChange);
  },
  beforeUnmount() {
    document.removeEventListener('visibilitychange', this.handleVisibilityChange);
  },
  methods: {
    handleVisibilityChange() {
      if (document.hidden) {
        document.title = this.hiddenTitle;
      } else {
        document.title = this.originalTitle;
      }
    }
  }
}

</script>
