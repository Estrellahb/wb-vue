<template>
  <div class="anime-content">
    <div class="block">
      <div class="anime-image">
        <el-image :src="imageUrl" lazy />
      </div>
    </div>
    <div class="anime-details">
      <div class="anime-header">
        <div class="anime-name">
          <div class="nameCN">
            {{ animeNameCN }}
          </div>
          <div class="nameJP">
            {{ animeNameJP }}
          </div>
        </div>
        <div class="state">
          {{ animeState }}
        </div>
      </div>
      <el-rate
        :modelValue="modelValue"
        disabled
        show-score
        text-color="#ff9900"
        :score-template="scoreTemplate"
        @update:modelValue="handleUpdate"
      />
      <div class="info">
        {{ animeInfo }}
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'AnimeDetail',
  props: {
    animeId: {
      type: Number,
      required: true
    },
    animeNameCN: {
      type: String,
      required: true
    },
    animeNameJP: {
      type: String,
      required: true
    },
    modelValue: {
      type: Number,
      required: true
    },
    animeInfo: {
      type: String,
      required: true
    },
    animeState: {
      type: String,
      required: true
    }
  },
  methods: {
    handleUpdate(value) {
      this.$emit('update:modelValue', value);
    }
  },
  computed: {
    scoreTemplate() {
      if (this.modelValue > 4) {
        return `{value} 神！伟大无需多言`;
      } else if (this.modelValue > 3) {
        return `{value} 很优秀`;
      } else if (this.modelValue > 2) {
        return `{value} 还可以`;
      } else if (this.modelValue > 1) {
        return `{value} 勉勉强强`;
      } else {
        return `{value} 这是屎`;
      }
    },
    imageUrl() {
      // 根据id值构建图片路径
      switch (this.animeId) {
        case 1:
          return require('@/assets/anime/GIRLSBANDCRY.jpg');
        case 2:
          return require('@/assets/anime/摇曳露营.png');
        case 3:
          return require('@/assets/anime/image1.png');
          case 4:
          return require('@/assets/anime/孤独摇滚.jpg');
          case 5:
          return require('@/assets/anime/轻音少女.jpg');
          case 6:
          return require('@/assets/anime/少女歌剧.jpg');
          case 7:
          return require('@/assets/anime/星际牛仔.jpg');
        default:
          return require('@/assets/头像.jpg');
      }
  }

  }
}
</script>

<style scoped>
.anime-content {
  display: flex;
  margin-top: 50px;
  margin-left: 10%;
}
.block {
  display: flex;
  align-items: center;
}
.anime-image {
  width: 180px;
  height: 220px;
}
.anime-details {
  display: flex;
  flex-direction: column;
  margin-left: 10px;
  align-items: flex-start;
}
.anime-header {
  display: flex;
  width: 100%;
  align-items: center;
  justify-content: space-between;
}
.anime-name {
  background-color: rgb(57, 57, 57);
  color: white;
  display: flex;
  flex-direction: column;
  align-items: flex-start;
  padding: 5px;
}
.state {
  background-color: rgb(23, 175, 28);
  color: white;
  padding: 5px;
  display: flex;
  align-items: center;
  white-space: nowrap; 
  border-radius: 5px;
}
.nameCN {
  font-size: 1.7em;
  font-weight: bold;
  margin-bottom: 10px;
}
.bgm-star {
  margin-top: 10px;
  margin-bottom: 10px;
}
.info {
  margin-top: 10px;
}
</style>
