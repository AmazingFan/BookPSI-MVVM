<template>
    <div>
    <div class="title" style="  color: #ffd04b ;float: left;padding: 6px" >图书进销存管理系统</div>
      <div style="float: right">
        <i class="el-icon-switch-button" v-on:click="logout" style="float:right;font-size: 40px;color: #ffd04b;padding: 10px"></i></div>
      <div style="float: right;padding: 20px">

      </div>
    </div>
</template>

<script>


    export default {
        name: "TopNavMenu",
      data(){
          return{
            user:{
              name:this.$store.state.user.username,
              date: new Date()
            }
          }
      },
      mounted:function () {


      },

      methods:{
        logout () {
          var _this = this
          this.$axios.get('/logout').then(resp => {
            if (resp.data.code === 200) {
              // 前后端状态保持一致
              _this.$store.commit('logout')
              _this.$router.replace({path: '/login'})

            }
          })
        },


      }
    }
</script>

<style scoped>
  .homeRouterView {
    margin-top: 10px;
  }

  .homeWelcome {
    text-align: center;
    font-size: 30px;
    font-family: 华文行楷;
    color: #409eff;
    padding-top: 50px;
  }

  .homeHeader {
    background-color: #DCDFE6;
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 0px 15px;
    box-sizing: border-box;
  }

  .homeHeader .title {
    font-size: 30px;
    font-family: 华文行楷;
    color: #ffffff
  }

  .homeHeader .userInfo {
    cursor: pointer;
  }

  .el-dropdown-link img {
    width: 48px;
    height: 48px;
    border-radius: 24px;
    margin-left: 8px;
  }

  .el-dropdown-link {
    display: flex;
    align-items: center;
  }
</style>
