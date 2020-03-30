<template>
  <div style="text-align: left">
    <el-tooltip effect="dark" content="一次添加一个" placement="right">
    <el-button class="add-button" type="primary" @click="dialogFormVisible = true" icon="el-icon-circle-plus-outline"
    style="margin: 18px" >添加出版社</el-button>
    </el-tooltip>
    <el-dialog
      title="添加/修改出版社"
      :visible.sync="dialogFormVisible"
      @close="clear">
      <el-form v-model="form" style="text-align: left" ref="dataForm">
        <el-form-item label="名字" :label-width="formLabelWidth" prop="name">
          <el-input v-model="form.name" autocomplete="off" ></el-input>
        </el-form-item>
        <el-form-item label="负责人" :label-width="formLabelWidth" prop="principal">
          <el-input v-model="form.principal" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="电话号码" :label-width="formLabelWidth" prop="phone">
          <el-input v-model="form.phone" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="地址" :label-width="formLabelWidth" prop="address">
          <el-input v-model="form.address" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="电子邮件" :label-width="formLabelWidth" prop="email">
          <el-input v-model="form.email" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item prop="id" style="height: 0">
          <el-input type="hidden" v-model="form.id" autocomplete="off"></el-input>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false">取 消</el-button>
        <el-button type="primary" @click="onSubmit">确 定</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
    export default {
        name: "PressEditForm",
      data(){
          return{
            dialogFormVisible: false,
            form: {
              id: '',
              name:'',
              principal:'',
              phone:'',
              address:'',
              email:''
            },
            formLabelWidth: '80px',
            press:[ ]
          }
      },
      methods: {
        clear () {
          this.form = {
            id: '',
            name:'',
            principal:'',
            phone:'',
            address:'',
            email:''
          }
        },
        onSubmit () {
          this.$axios
            .post('/press', {
              id: this.form.id,
              name:this.form.name,
              principal:this.form.principal,
              phone:this.form.phone,
              address:this.form.address,
              email:this.form.email

            }).then(resp => {
            if (resp && resp.status === 200) {
              this.dialogFormVisible = false
              this.$emit('onSubmit')
            }
          })
        },
        uploadImg () {
          this.form.cover = this.$refs.imgUpload.url
        },

      }
    }
</script>

<style scoped>

</style>
