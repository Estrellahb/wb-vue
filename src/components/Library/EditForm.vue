<template>
    <div>
      <i class="el-icon-circle-plus-outline" @click="dialogFormVisible = true"></i>
      <el-dialog
        title="添加/修改图书"
        :visible.sync="dialogFormVisible"
        @close="clear">
        <el-form v-model="form" style="text-align: left" ref="dataForm">
          <!-- 表单项 -->
        </el-form>
        <template #footer>
          <el-button @click="dialogFormVisible = false">取 消</el-button>
          <el-button type="primary" @click="onSubmit">确 定</el-button>
        </template>
      </el-dialog>
    </div>
  </template>
  
  <script>
  import { ref, reactive, toRefs } from 'vue'
  import axios from 'axios'
  
  export default {
    name: 'EditForm',
    setup() {
      const dialogFormVisible = ref(false)
      const form = reactive({
        id: '',
        title: '',
        author: '',
        date: '',
        press: '',
        cover: '',
        abs: '',
        category: {
          id: '',
          name: ''
        }
      })
  
      const clear = () => {
        form.id = ''
        form.title = ''
        form.author = ''
        form.date = ''
        form.press = ''
        form.cover = ''
        form.abs = ''
        form.category.id = ''
        form.category.name = ''
      }
  
      const onSubmit = async () => {
        const response = await axios.post('/books', {
          id: form.id,
          cover: form.cover,
          title: form.title,
          author: form.author,
          date: form.date,
          press: form.press,
          abs: form.abs,
          category: form.category
        })
        if (response && response.status === 200) {
          dialogFormVisible.value = false
          emit('onSubmit')
        }
      }
  
      return {
        dialogFormVisible,
        form,
        clear,
        onSubmit
      }
    }
  }
  </script>
  
  <style scoped>
    .el-icon-circle-plus-outline {
      margin: 50px 0 0 20px;
      font-size: 100px;
      float: left;
      cursor: pointer;
    }
  </style>
  