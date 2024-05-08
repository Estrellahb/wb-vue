import { createStore } from 'vuex'

export default createStore({
  state: {
    user: {
      username: JSON.parse(localStorage.getItem('user') || '{}').username
    }
  },
  getters: {
  },
  mutations: {
    login(state, user) {
      state.user = user
      localStorage.setItem('user', JSON.stringify(user))
    }
  },
  actions: {
  },
  modules: {
  }
})
