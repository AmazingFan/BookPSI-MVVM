<template>
<body id="paper">
  <el-form ref="form" :model="loginForm" class="login" label-position="left" label-width="70px">
    <h3 class="login_title">系统登录</h3>
    <el-form-item label="用户名" >
      <el-input v-model="loginForm.username" placeholder="默认用户名user"></el-input>
    </el-form-item>
    <el-form-item label="密码" >
      <el-input type="password" v-model="loginForm.password" placeholder="默认密码123"></el-input>
    </el-form-item>
    <el-button type="primary" style="width: 40%;background: #409EFF;border: none" @click="login">登录</el-button>
  </el-form>
  </body>

</template>

<script>
    export default {
        name: "Login",
      data(){
          return{
            loginForm:{
              username:'',
              password:''
            },
            responseResult:[]
          }
      },
      methods:{
          login(){
            this.$axios
              .post('/login', {
                username: this.loginForm.username,
                password: this.loginForm.password
              })
              .then(resp => {
                if (resp.data.code === 200) {
                  var data = resp.data.data
                  this.$store.commit('login', data)
                  this.$router.replace({path: '/index'})

                }else {
                  this.$alert(resp.data.message, '提示', {
                    confirmButtonText: '确定'
                  })
                }
              })
              .catch(failResponse => {
              })

          },
        register(){
            this.$router.replace({path:'/register'})
        }

      }
    }
</script>

<style scoped>
  #paper {
    background:url("../assets/bg.jpg") no-repeat;
    background-position: center;
    height: 100%;
    width: 100%;
    background-size: cover;
    position:fixed;
  }
body{
  margin: -8px;
}
.login{
  border-radius: 15px;
  background-clip: padding-box;
  margin: 90px auto;
  width: 350px;
  padding: 35px 35px 15px 35px;
  background: #fff;
  border: 1px solid #eaeaea;
  box-shadow: 0 0 25px #cac6c6;
}
  .login_title{
    margin: 0px auto 40px auto;
    text-align: center;
    color: #505458;
  }
</style>
