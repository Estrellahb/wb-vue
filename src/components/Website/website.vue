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
                    <font-awesome-icon :icon="website.icon" size="lg" />
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
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome';
import { faGoogle, faGithub, faFacebook} from '@fortawesome/free-brands-svg-icons';
import { faCat } from '@fortawesome/free-solid-svg-icons';


export default {
  components: {
    FontAwesomeIcon,
  },
  data() {
    return {
      showComment: null,
      categorizedWebsites: {
        '搜索引擎': [
          { id: 1, name: 'Google', url: 'https://www.google.com', icon: faGoogle, comment: '搜索神器' },
          { id: 2, name: 'Yandex', url: 'https://yandex.com/', icon: faCat, comment: '毛子的搜索引擎，搜图特好用' },
        ],
        '开源社区': [
          { id: 3, name: 'GitHub', url: 'https://github.com', icon: faGithub, comment: '程序员的交友网站' },
        ],
        '社交网络': [
          { id: 4, name: 'Facebook', url: 'https://www.facebook.com', icon: faFacebook, comment: '社交网站' },
        ],
        '压制与字幕组': [
          { id: 5, name: 'VCB', url: 'https://vcb-s.com', icon: faCat, comment: '收藏级压制组' },
          { id: 6, name: 'Anime字幕论坛', url: 'https://bbs.acgrip.com/', icon: faCat, comment: '动画字幕网站' },
          { id: 7, name: '诸神字幕组', url: 'https://subs.kamigami.org', icon: faCat, comment: '字幕组' },
          { id: 8, name: '幻樱字幕组', url: 'http://www.hysub.net/?ref=acgdh.cc', icon: faCat, comment: '番剧下载' },
          { id: 9, name: 'SubHD', url: 'https://subhd.tv/', icon: faCat, comment: '字幕下载' },
        ],
        '番剧下载': [
          { id: 10, name: '萌番组', url: 'https://bangumi.moe', icon: faCat, comment: '番剧下载' },
          { id: 11, name: '末日動漫資源庫', url: 'https://share.acgnx.se/', icon: faCat, comment: '番剧下载' },
          { id: 12, name: 'Nyaa', url: 'https://nyaa.si/', icon: faCat, comment: 'Nyaa是一个侧重于东亚多媒体资源的BitTorrent站点。要科技' },
          { id: 13, name: '蜜柑计划', url: 'https://mikanani.me/', icon: faCat, comment: '番剧订阅下载' },
          { id: 14, name: '动漫花园', url: 'https://share.dmhy.org/', icon: faCat, comment: '番剧下载' },
          { id: 15, name: '天使动漫论坛', url: 'https://www.tsdm39.com/forum.php', icon: faCat, comment: '里面有很多bd自购大佬' },
          { id: 16, name: 'ACGRIP', url: 'https://acgrip.art/', icon: faCat, comment: '番剧下载' },
        ],
        '在线番剧网站': [
          { id: 17, name: 'AGE动漫', url: 'https://www.agedm.org/', icon: faCat, comment: '在线视频网站' },
          { id: 18, name: '樱花动漫', url: 'http://www.iyinghua.io/', icon: faCat, comment: '在线视频网站' },
          { id: 19, name: 'bangumi', url: 'https://bgm.tv/', icon: faCat, comment: '二次元社区' },
          { id: 20, name: 'YuC AnimeList', url: 'https://yuc.wiki/', icon: faCat, comment: '番剧更新讯息' },
        ],
        '工具类': [
          { id: 21, name: '番剧图片搜索引擎', url: 'https://trace.moe/', icon: faCat, comment: '图片定位视频地址' },
          { id: 22, name: 'free download', url: 'https://www.freedownloadmanager.org/zh/', icon: faCat, comment: '下载工具，兼容浏览器下载' },
          { id: 23, name: '图吧工具箱', url: 'https://www.tbtool.cn/', icon: faCat, comment: '计算机硬件检测实用工具' },
          { id: 24, name: 'qbittonrrent', url: 'https://www.qbittorrent.org/download', icon: faCat, comment: '免费bt磁力下载工具 便携版本：https://www.52pojie.cn/thread-1851155-1-1.html' },
          { id: 25, name: '7-zip', url: 'https://www.7-zip.org/download.html', icon: faCat, comment: '占用空间最小的解压与压缩软件' },
        ],
      }

    }
  }
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
