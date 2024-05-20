<template>
  <div>
    <el-row style="height: 840px;">
      <SearchBar @onSearch="searchResult" ref="searchBar" />
      <el-tooltip effect="dark" placement="right" v-for="item in paginatedBooks" :key="item.id">
        <template #content>
          <p style="font-size: 14px;margin-bottom: 6px;">{{ item.title }}</p>
          <p style="font-size: 13px;margin-bottom: 6px">
            <span>{{ item.author }}</span> /
            <span>{{ item.date }}</span> /
            <span>{{ item.press }}</span>
          </p>
          <p style="width: 300px" class="abstract">{{ item.abs }}</p>
        </template>
        <el-card
          style="width: 135px;margin-bottom: 20px;height: 233px;float: left;margin-right: 15px"
          class="book"
          body-style="padding:10px"
          shadow="hover">
          <div class="cover" @click="editBook(item)">
            <img :src="item.cover" alt="封面">
          </div>
          <div class="info">
            <div class="title">
              <a href="">{{ item.title }}</a>
            </div>
            <i class="el-icon-delete" @click="deleteBook(item.id)"></i>
          </div>
          <div class="author">{{ item.author }}</div>
        </el-card>
      </el-tooltip>
      <EditForm @onSubmit="loadBooks" ref="edit" />
    </el-row>
    <el-row>
      <el-pagination
        @update:current-page="handleCurrentChange"
        :current-page="currentPage"
        :page-size="pagesize"
        :total="books.length"
      />
    </el-row>
  </div>
</template>

<script>
import { ref, onMounted, computed } from 'vue'
import SearchBar from './SearchBar.vue'
import EditForm from './EditForm.vue'
import axios from 'axios'

export default {
  name: 'Books',
  components: { EditForm, SearchBar },
  setup() {
    const searchBar = ref(null)
    const editForm = ref(null)
    const books = ref([])
    const currentPage = ref(1)
    const pagesize = ref(17)

    const handleCurrentChange = (newPage) => {
      currentPage.value = newPage
    }

    const searchResult = async () => {
      const response = await axios.get('/search?keywords=' + searchBar.value.keywords)
      if (response && response.status === 200) {
        books.value = response.data
      }
    }

    const deleteBook = async (id) => {
      try {
        await axios.post('/delete', { id })
        loadBooks()
      } catch (error) {
        console.error('取消删除', error)
      }
    }

    const editBook = (item) => {
      editForm.value.dialogFormVisible = true
      editForm.value.form = {
        id: item.id,
        cover: item.cover,
        title: item.title,
        author: item.author,
        date: item.date,
        press: item.press,
        abs: item.abs,
        category: {
          id: item.category.id.toString(),
          name: item.category.name
        }
      }
    }

    const loadBooks = async () => {
      const response = await axios.get('/books')
      if (response && response.status === 200) {
        books.value = response.data
      }
    }

    const paginatedBooks = computed(() => {
      return books.value.slice((currentPage.value - 1) * pagesize.value, currentPage.value * pagesize.value)
    })

    onMounted(async () => {
      await loadBooks()
    })

    return {
      searchBar,
      editForm,
      books,
      currentPage,
      pagesize,
      handleCurrentChange,
      searchResult,
      deleteBook,
      editBook,
      paginatedBooks
    }
  }
}
</script>

<style scoped>

  .cover {
    width: 115px;
    height: 172px;
    margin-bottom: 7px;
    overflow: hidden;
    cursor: pointer;
  }

  img {
    width: 115px;
    height: 172px;
    /*margin: 0 auto;*/
  }

  .title {
    font-size: 14px;
    text-align: left;
  }

  .author {
    color: #333;
    width: 102px;
    font-size: 13px;
    margin-bottom: 6px;
    text-align: left;
  }

  .abstract {
    display: block;
    line-height: 17px;
  }

  .el-icon-delete {
    cursor: pointer;
    float: right;
  }

  .switch {
    display: flex;
    position: absolute;
    left: 780px;
    top: 25px;
  }

  a {
    text-decoration: none;
  }

  a:link, a:visited, a:focus {
    color: #3377aa;
  }

</style>
