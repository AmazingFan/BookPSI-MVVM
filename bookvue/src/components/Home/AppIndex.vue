<template xmlns:el-col="http://www.w3.org/1999/html">

    <el-container class="el-container">
     <el-header class="homeHeader" ><TopNavMenu></TopNavMenu></el-header>
      <el-header><el-divider style="margin: 10px 2%" content-position="left">{{date}}</el-divider></el-header>
      <el-container>
        <el-aside width="200px"><NavMenu></NavMenu></el-aside>

        <el-main> <router-view/></el-main>

      </el-container>
      <el-footer>
        <div>

          <el-divider direction="vertical"></el-divider>
          <i class="el-icon-timer"></i>
          <el-divider direction="vertical"></el-divider>

        </div>
        <el-divider content-position="right">February</el-divider>
      </el-footer>
    </el-container>



</template>

<script>
  import NavMenu from "../common/NavMenu";
  import TopNavMenu from "../common/TopNavMenu";
  import Book from "../book/Book";
  export default {
    name: "AppIndex",
    components:{NavMenu,TopNavMenu,Book},
    data(){
      return{
        date: new Date()
      }

  },

    mounted(){
      this.open1()
        var _this = this;
        this.timer = setInterval(function() {
          _this.date = new Date();
        }, 1000);
      },
      beforeDestroy () {
        if(this.timer) {
          clearInterval(this.timer);
        }
      },


    methods:{
      open1() {
        const h = this.$createElement;

        this.$notify({
          title: '欢迎登陆图书进销存管理系统',
          message: h('i', { style: 'color: teal'}, this.$store.state.user.username)
        });
      },

    }
  }
</script>

<style scoped>
  .homeHeader {
    background-color: #293D55;

  }

</style>

