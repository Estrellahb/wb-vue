<template>
  <div class="website-index">
    <el-card class="transparent-card">
      <div class="background"></div>
      <div class="website-list">
        <template v-for="(websites, category) in categorizedWebsites" :key="category">
          <h2 class="category-title">{{ category }}</h2>
          <hr>
          <el-row :gutter="20">
            <el-col :span="8" v-for="website in websites" :key="website.id">
              <a :href="website.url" target="_blank" class="website-link">
                <el-card class="website-card"
                         @mouseenter="showComment = website.id"
                         @mouseleave="showComment = null">
                  <div class="website-icon">
                    <font-awesome-icon :icon="getIcon(website.icon)" size="lg" />
                  </div>
                  <div class="website-name">{{ website.name }}</div>
                  <div class="website-url">{{ website.url }}</div>
                  <div class="website-comment" v-if="website.comment && showComment === website.id">
                    {{ website.comment }}
                  </div>
                </el-card>
              </a>
            </el-col>
          </el-row>
        </template>
      </div>
    </el-card>
  </div>
</template>

<script>
// import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome';
// import { faGoogle, faGithub, faFacebook} from '@fortawesome/free-brands-svg-icons';
// import { faCat } from '@fortawesome/free-solid-svg-icons';
// import axios from 'axios';

import axios from 'axios';
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome';
import { library } from '@fortawesome/fontawesome-svg-core';
import { faGoogle, faGithub, faFacebook} from '@fortawesome/free-brands-svg-icons';
import { faCat as faSolidCat } from '@fortawesome/free-solid-svg-icons';

library.add(faGoogle, faGithub, faFacebook, faSolidCat);

export default {
  components: {
    FontAwesomeIcon,
  },
  data() {
    return {
      showComment: null,
      categorizedWebsites: {},
      icons: {
        faGoogle: ['fab', 'google'],
        faGithub: ['fab', 'github'],
        faFacebook: ['fab', 'facebook'],
        faCat: ['fas', 'cat'],
      },
    };
  },
  methods: {
    async fetchWebsites() {
      try {
        const response = await axios.get('/website');
        const websites = response.data;

        // Categorize websites
        const categorized = websites.reduce((acc, website) => {
          if (!acc[website.category]) {
            acc[website.category] = [];
          }
          acc[website.category].push(website);
          return acc;
        }, {});

        this.categorizedWebsites = categorized;
      } catch (error) {
        console.error("Error fetching websites:", error);
      }
    },
    getIcon(iconName) {
      return this.icons[iconName] || this.icons.faCat; // 返回图标或默认图标
    },
  },
    created() {
      this.fetchWebsites();
    },
  }
</script>

<style scoped>
hr {
  border: 1px solid #b7b7b7; /* 横线样式，颜色可以根据需要调整 */
  
}
.transparent-card {
  background-color: rgba(255, 255, 255, 0.7); /* 设置 el-card 的背景色为透明 */
  border: none; /* 移除边框 */
}
.category-title {
  font-size: 1.6em; /* 根据需要调整字体大小 */
  color: #3d88f8; /* 蓝色，根据需要调整颜色 */
  text-align: left; /* 靠左对齐 */
  margin-bottom: 1em; /* 下边距 */
  padding-left: 20px; /* 左内边距，根据需要调整 */
}
.website-index {
  padding: 20px 10%;
  font-family: 'Open Sans', sans-serif;
}

.website-list {
  margin-top: 20px;
  
}

.website-link {
  text-decoration: none;
  color: inherit;
}

.website-card {
  height: 150px;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  text-align: center;
  border-radius: 10px;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
  transition: transform 0.3s ease, box-shadow 0.3s ease;
  background-color: #f9f9f9;
  margin-top: 20px;
}

.website-card:hover {
  transform: translateY(-5px);
  box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
}

.website-icon {
  margin-bottom: 10px;
  color: #409EFF;
}

.website-name {
  font-size: 1.2em;
  font-weight: bold;
  margin-bottom: 5px;
}

.website-url {
  color: #909399;
  font-size: 0.9em;
  margin-bottom: 10px;
}

.website-comment {
  font-size: 0.9em;
  color: #909399;
}

.background {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-image: url("@/assets/夏_5435590.jpg");
  background-size: cover;
  background-position: center;
  opacity: 0.8;
  z-index: -1;
}
</style>
