<template>
    <div class="videoWrap">
      <video-player
        class="video-player vjs-custom-skin"
        ref="videoPlayer"
        :playsinline="true"
        :options="playerOptions"
        @play="onPlayerPlay($event)"
        @pause="onPlayerPause($event)"
        @ended="onPlayerEnded($event)"
        @waiting="onPlayerWaiting($event)"
        @playing="onPlayerPlaying($event)"
        @loadeddata="onPlayerLoadeddata($event)"
        @timeupdate="onPlayerTimeupdate($event)"
        @canplay="onPlayerCanplay($event)"
        @canplaythrough="onPlayerCanplaythrough($event)"
        @statechanged="playerStateChanged($event)"
        @ready="playerReadied">
      </video-player>
    </div>
  </template>
  
  <script>
  import { ref, onMounted } from 'vue'
  import { videoPlayer } from 'vue-video-player'
  import 'video.js/dist/video-js.css'
  
  import test from '@/assets/test.mp4'
  import img from '@/assets/logo.png'
  
  export default {
    components: {
      videoPlayer
    },
    setup() {
      const videoPlayerRef = ref(null)
      const playerOptions = ref({
        playbackRates: [0.7, 1.0, 1.5, 2.0],
        autoplay: false,
        muted: false,
        loop: false,
        preload: 'auto',
        language: 'zh-CN',
        aspectRatio: '15:6',
        fluid: true,
        sources: [],
        poster: img,
        notSupportedMessage: '此视频暂无法播放，请稍后再试',
        controlBar: {
          timeDivider: true,
          durationDisplay: true,
          remainingTimeDisplay: true,
          progressControl: true,
          fullscreenToggle: true
        }
      })
  
      onMounted(() => {
      // 组件挂载时获取视频的 URL
      fetch('/api/video')
        .then(response => response.text())
        .then(videoUrl => {
          // 设置视频源
          playerOptions.value.sources = [{
            src: videoUrl,
            type: 'video/mp4'
          }]
        })
        .catch(error => {
          console.error('Failed to fetch video:', error)
        })
    })
  
      const onPlayerPlay = (event) => {
        console.log("player play!", event);
      }
  
      const onPlayerPause = (event) => {
        console.log("player pause!", event);
      }
  
      const onPlayerEnded = (event) => {
        console.log("player end!", event);
      }
  
      const onPlayerWaiting = (event) => {
        console.log("Player Waiting", event);
      }
  
      const onPlayerPlaying = (event) => {
        console.log("Player Playing", event);
      }
  
      const onPlayerLoadeddata = (event) => {
        console.log("Player Loadeddata", event);
      }
  
      const onPlayerTimeupdate = (event) => {
        console.log("Player Timeupdate", event);
      }
  
      const onPlayerCanplay = (event) => {
        console.log('player Canplay!', event);
      }
  
      const onPlayerCanplaythrough = (event) => {
        console.log('player Canplaythrough!', event);
      }
  
      const playerStateChanged = (event) => {
        console.log("player current update state", event);
      }
  
      const playerReadied = (event) => {
        console.log("example player 1 readied", event);
      }
  
      return {
        videoPlayerRef,
        playerOptions,
        onPlayerPlay,
        onPlayerPause,
        onPlayerEnded,
        onPlayerWaiting,
        onPlayerPlaying,
        onPlayerLoadeddata,
        onPlayerTimeupdate,
        onPlayerCanplay,
        onPlayerCanplaythrough,
        playerStateChanged,
        playerReadied
    }
  }
}
</script>

<style  scoped>
.videoWrap {
  width: 100%;
  height: calc(100vh - 100px);
  ::v-deep video {
    object-fit: fill;
  }
  /* 视频开始的按钮样式 */
  ::v-deep.video-js .vjs-big-play-button {
    border-width: 3px;
    border-color: rgb(255, 255, 255);
    border-style: solid;
    border-radius: 50%;
    width: 56px;
    height: 56px;
    line-height: 50px;
    background-color: rgba(0, 0, 0, 0);
    position: absolute;
    top: 0;
    bottom: 0;
    left: 0;
    right: 0;
    margin: auto;
  }
  /* 滚动条的样式 */
  ::v-deep.video-js .vjs-control-bar {
    background-color: rgba(43, 51, 63, 0);
  }
  ::v-deep.video-js .vjs-play-progress {
    background-color: rgb(238, 191, 0);
  }
  ::v-deep.video-js .vjs-load-progress div {
    background-color: rgb(255, 255, 255);
  }
}
</style>