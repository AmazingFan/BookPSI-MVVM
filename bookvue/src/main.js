// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import router from './router'
import ElementUI from 'element-ui'
import 'element-ui/lib/theme-chalk/index.css'
import store from './store'
import ECharts from 'vue-echarts'
import 'echarts/lib/chart/bar'
import 'echarts/lib/component/tooltip'

var axios = require('axios')
//axios.defaults.baseURL = "http://106.54.137.127:8443/api";
axios.defaults.baseURL = 'http://localhost:8443/api'
Vue.prototype.$axios = axios

axios.defaults.withCredentials = true

Vue.component('v-chart', ECharts)

Vue.config.productionTip = false
Vue.use(ElementUI)
/* eslint-disable no-new */

router.beforeEach((to, from, next) => {
    if (store.state.user.username && to.path.startsWith('/index')) {
      axios.get('/authentication').then(resp => {
        initAdminMenu(router, store)
      })
    }
    if (to.meta.requireAuth) {
      if (store.state.user.username) {
        axios.get('/authentication').then(resp => {
          if (resp) next()
        })
      } else {
        next({
          path: 'login',
          query: {redirect: to.fullPath}
        })
      }
    } else {
      next()
    }
  }
)

// http request拦截器，为请求加上 token，测试用
/* axios.interceptors.request.use(
  config => {
    // 输出当前状态下的 token
    // console.log(store.state.user.token)
    if (store.state.user.token) {
      // 判断当前是否存在token，如果存在的话，则每个http header都加上token
      // config.headers.Token = `token ${JSON.stringify(store.state.user.token)}`
      config.headers.Token = JSON.stringify(store.state.user.token)
    } else {
      config.headers.Token = null
    }
    return config
  },
  err => {
    return Promise.reject(err)
  }
) */

// http response 拦截器
axios.interceptors.response.use(
  response => {
    return response
  },
  error => {
    console.log(error.response)
    if (error) {
      router.replace('/login')
    }
    // 返回接口返回的错误信息
    return Promise.reject(error.response.data)
  })

const initAdminMenu = (router, store) => {
  if (store.state.adminMenus.length > 0) {
    return
  }
  axios.get('/menu').then(resp => {
    if (resp && resp.status === 200) {
      var fmtRoutes = formatRoutes(resp.data)
      router.addRoutes(fmtRoutes)
      store.commit('initAdminMenu', fmtRoutes)
    }
  })
}

const formatRoutes = (routes) => {
  let fmtRoutes = []
  routes.forEach(route => {
    if (route.children) {
      route.children = formatRoutes(route.children)
    }

    let fmtRoute = {
      path: route.path,
      component: resolve => {
        require(['./components/common/' + route.component + '.vue'], resolve)
      },
      name: route.name,
      nameZh: route.nameZh,
      icon: route.icon,
      meta: {
        requireAuth: true
      },
      children: route.children
    }
    fmtRoutes.push(fmtRoute)
  })
  return fmtRoutes
}



new Vue({
  el: '#app',
  render: h => h(App),
  router,
  store,
  components: { App },
  template: '<App/>'
})
