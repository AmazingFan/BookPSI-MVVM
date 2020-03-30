import Vue from 'vue'
import Router from 'vue-router'
import HelloWorld from '@/components/HelloWorld'
import Login from "../components/Login"
import AppIndex from "../components/Home/AppIndex";
import Register from "../components/Register";
import Book from "../components/book/Book";
import User from "../components/user/User";
import Press from "../components/book/Press";
import Role from "../components/user/Role";
import OrderIndex from "../components/order/OrderIndex";
import Stock from "../components/order/Stock";
import Dashboard from "../components/Dashboard/Dashboard";
import Sale from "../components/order/Sale";
import SaleOrder from "../components/order/SaleOrder";
import FindOrder from "../components/order/FindOrder";
import Return from "../components/order/Return";

Vue.use(Router)
const routerPush = Router.prototype.push
Router.prototype.push = function push(location) {
  return routerPush.call(this, location).catch(error=> error)
}
export default new Router({
  mode:'history',
  routes: [
    /*{
      path: '/',
      name: 'Default',
      redirect: '/index',
      component: AppIndex
    },
*/
    {
      path: '/index',
      name: '主页',
      component: AppIndex,
      meta: {
        requireAuth: true
      },
      children:[{

          path:'/index/book',
          name:'书',
          component:Book,
        meta: {
          requireAuth: true
        }

      },
        {
          path:'/index/user',
          name:'用户',
          component:User,
          meta: {
            requireAuth: true
          }
        },
        {
          path:'/index/press',
          name:'出版社',
          component:Press,
          meta: {
            requireAuth: true
          }
        },
        {
          path:'/index/role',
          name:'角色',
          component:Role,
          meta: {
            requireAuth: true
          }
        },
        {
          path:'/index/order',
          name:'订单',
          component:OrderIndex,
          meta: {
            requireAuth: true
          }
        },
        {
          path:'/index/stock',
          name:'下单',
          component:Stock,
          meta: {
            requireAuth: true
          }
        },
        {
          path:'/index/dashboard',
          name:'主页面板',
          component:Dashboard,
          meta: {
            requireAuth: true
          }
        },
        {
          path:'/index/sale',
          name:'销售记录',
          component:Sale,
          meta: {
            requireAuth: true
          }
        },
        {
          path:'/index/saleorder',
          name:'销售书籍',
          component:SaleOrder,
          meta: {
            requireAuth: true
          }
        },
        {
          path:'/index/findorder',
          name:'订单查找',
          component:FindOrder,
          meta: {
            requireAuth: true
          }
        },
        {
          path:'/index/return',
          name:'入库退货',
          component:Return,
          meta: {
            requireAuth: true
          }
        }
      ]
    },
    {
      path:'/register',
      name:'注册',
      component:Register
    },
    {

      path: '/login',
      name: '登录',
      component: Login
    }
  ]
})

