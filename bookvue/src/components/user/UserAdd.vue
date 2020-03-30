<template>
  <div style="text-align: left">
    <el-button class="add-button" type="primary" icon="el-icon-circle-plus-outline" @click="dialogFormVisible = true" style="margin: 18px">批量添加用户</el-button>
    <el-dialog
      title="添加用户"
      :visible.sync="dialogFormVisible"
      @close="clear"
      width="25%">
      <el-form :model="loginForm" :rules="rules" label-position="left"
               label-width="0px">
        <el-form-item prop="username">
          <el-input type="text" v-model="loginForm.username"
                    auto-complete="off" placeholder="用户名"></el-input>
        </el-form-item>
        <el-form-item prop="password">
          <el-input type="password" v-model="loginForm.password"
                    auto-complete="off" placeholder="密码"></el-input>
        </el-form-item>
        <el-form-item prop="text">
          <el-input type="text" v-model="loginForm.account"
                    auto-complete="off" placeholder="账号"></el-input>
        </el-form-item>
        <el-form-item>
          <el-input type="text" v-model="loginForm.realname"
                    auto-complete="off" placeholder="真实姓名"></el-input>
        </el-form-item>
        <el-form-item>
          <el-input type="text" v-model="loginForm.phone"
                    auto-complete="off" placeholder="电话号码"></el-input>
        </el-form-item>
        <el-form-item>
          <el-input type="text" v-model="loginForm.gender"
                    auto-complete="off" placeholder="性别"></el-input>
        </el-form-item>
        <el-form-item>
          <el-input type="text" v-model="loginForm.address"
                    auto-complete="off" placeholder="地址"></el-input>
        </el-form-item>
        <el-form-item>
          <el-input type="text" v-model="loginForm.email"
                    auto-complete="off" placeholder="E-Mail"></el-input>
        </el-form-item>
        <el-form-item>
          <el-input type="text" v-model="loginForm.idcard"
                    auto-complete="off" placeholder="身份证号"></el-input>
        </el-form-item>
        <el-form-item style="width: 100%">
          <el-button type="primary" style="width: 40%;background: #505458;border: none" v-on:click="register">添加</el-button>
        </el-form-item>
      </el-form>
    </el-dialog>
  </div>
</template>

<script>
  export default {
    name: 'UserAdd',
    data () {
      return {
        dialogFormVisible: false,
        rules: {
          username: [{required: true, message: '用户名不能为空', trigger: 'blur'}],
          password: [{required: true, message: '密码不能为空', trigger: 'blur'}]
        },
        loginForm: {
          username: '',
          account:'',
          password: '',
          realname:'',
          gender:'',
          address:'',
          phone: '',
          email: '',
          idcard:''
        }
      }
    },
    methods: {
      clear () {
        this.loginForm = {
          username: '',
          account:'',
          password: '',
          realname: '',
          phone: '',
          gender:'',
          address:'',
          email: '',
          idcard:''
        }
      },
      register () {
        this.$axios
          .post('/register', {
            username: this.loginForm.username,
            account:this.loginForm.account,
            password: this.loginForm.password,
            realname: this.loginForm.realname,
            phone: this.loginForm.phone,
            gender:this.loginForm.gender,
            address:this.loginForm.address,
            email: this.loginForm.email,
            idcard:this.loginForm.idcard
          })
          .then(resp => {
            if (resp.data.code === 200) {
              this.$alert('注册成功', '提示', {
                confirmButtonText: '确定'
              })
              this.clear()
              this.$emit('onSubmit')
            } else {
              this.$alert(resp.data.message, '提示', {
                confirmButtonText: '确定'
              })
            }
          })
          .catch(failResponse => {})
      }
    }
  }
</script>

<style scoped>

</style>
