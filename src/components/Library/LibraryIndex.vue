<template>
  <el-container>
    <el-aside style="width: 200px;margin-top: 20px">
      <switch></switch>
      <SideMenu @indexSelect="listByCategory" ref="sideMenu" />
    </el-aside>
    <el-main>
      <Books class="books-area" ref="booksArea" />
    </el-main>
  </el-container>
</template>

<script>
import { ref, onMounted } from 'vue'
import SideMenu from './SideMenu.vue'
import Books from './Books.vue'
import axios from 'axios'

export default {
  name: 'AppLibrary',
  components: { Books, SideMenu },
  setup() {
    const sideMenu = ref(null)
    const booksArea = ref(null)

    const listByCategory = async () => {
      if (sideMenu.value) {
        const cid = sideMenu.value.cid
        const url = `categories/${cid}/books`
        const response = await axios.get(url)
        if (response && response.status === 200) {
          booksArea.value.books = response.data
        }
      }
    }

    onMounted(() => {
      listByCategory()
    })

    return {
      sideMenu,
      booksArea,
      listByCategory
    }
  }
}
</script>

<style scoped>
.books-area {
  width: 990px;
  margin-left: auto;
  margin-right: auto;
}
</style>
