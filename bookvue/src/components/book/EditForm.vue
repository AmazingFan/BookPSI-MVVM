<template>
  <div style="text-align: left">
    <el-button class="add-button" type="primary" @click="dialogFormVisible = true" icon="el-icon-circle-plus-outline">添加图书</el-button>
    <el-dialog
      title="添加/修改图书"
      :visible.sync="dialogFormVisible"
      @close="clear">
      <el-form v-model="form" style="text-align: left" ref="dataForm">
        <el-form-item label="书名" :label-width="formLabelWidth" prop="title">
          <el-input v-model="form.title" autocomplete="off" placeholder="不加《》" clearable></el-input>
        </el-form-item>
        <el-form-item label="作者" :label-width="formLabelWidth" prop="author">
          <el-input v-model="form.auther" autocomplete="off" clearable></el-input>
        </el-form-item>
        <el-form-item label="ISBN" :label-width="formLabelWidth" prop="isbn">
          <el-input v-model="form.isbn" autocomplete="off" clearable></el-input>
        </el-form-item>
        <el-form-item label="库存" :label-width="formLabelWidth" prop="stock">
          <el-input-number v-model="form.stock" autocomplete="off" clearable></el-input-number>
        </el-form-item>
        <el-form-item label="最低库存" :label-width="formLabelWidth" prop="lowstock">
          <el-input-number v-model="form.lowstock" autocomplete="off" clearable></el-input-number>
        </el-form-item>
        <el-form-item label="批发价" :label-width="formLabelWidth" prop="purchaseprice">
          <el-input v-model="form.purchaseprice" autocomplete="off" clearable></el-input>
        </el-form-item>
        <el-form-item label="售价" :label-width="formLabelWidth" prop="sellprice">
          <el-input v-model="form.sellprice" autocomplete="off" clearable></el-input>
        </el-form-item>
        <el-form-item label="销量" :label-width="formLabelWidth" prop="sale">
          <el-input v-model="form.sale" autocomplete="off" clearable></el-input>
        </el-form-item>
        <el-form-item label="开本" :label-width="formLabelWidth" prop="format">
          <el-input-number v-model="form.format" autocomplete="off" clearable ></el-input-number>
        </el-form-item>
        <el-form-item label="描述" :label-width="formLabelWidth" prop="description">
          <el-input v-model="form.description" autocomplete="off" maxlength="30" show-word-limit clearable></el-input>
        </el-form-item>
        <el-form-item label="出版社" :label-width="formLabelWidth" prop="pressid">
          <el-select v-model="form.press.id" placeholder="出版社">
            <el-option
              v-for="item in this.$parent.press"
              :key="item.id"
              :label="item.name"
              :value="item.id"
            >
            </el-option>
          </el-select>
        </el-form-item>

        <el-form-item label="分类" :label-width="formLabelWidth" prop="categoryid">
          <el-select v-model="form.category.id" placeholder="请选择分类">
            <el-option
              v-for="item in this.$parent.category"
              :key="item.id"
              :label="item.name"
              :value="item.id"
            >
            </el-option>
          </el-select>
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
    name: 'EditForm',

    data () {
      return {
        dialogFormVisible: false,
        form: {
          id: '',
          title: '',
          auther: '',
          sellprice:'',
          purchaseprice:'',
          pressid:'',
          press:{
            id:'',
            name:'',
          },
          stock:'',
          isbn:'',
          sale:'',
          lowstock:'',
          description:'',
          format:'',
          categoryid:'',
          category: {
            id: '',
            name: ''
          },

        },
        formLabelWidth: '80px',
        categoryname:'',
        press:[ ]
      }
    },
    methods: {
      clear () {
        this.form = {
          id: ' ',
          title: ' ',
          auther: ' ',
          sellprice:'',
          purchaseprice:'',
          pressid:'',
          press:{
            id:'',
            name:'',
          },
          stock:'',
          isbn:'',
          sale:'',
          lowstock:'',
          description:'',
          format:'',
          category: {
            id: '',
            name: ''
          },

        }
      },
      onSubmit () {
        this.$axios
          .post('/book', {
            id: this.form.id,
            title: this.form.title,
            auther: this.form.auther,
            press: this.form.press,
            category: this.form.category,
            sellprice:this.form.sellprice,
            purchaseprice:this.form.purchaseprice,
            stock:this.form.stock,
            isbn:this.form.isbn,
            sale:this.form.sale,
            lowstock:this.form.lowstock,
            description:this.form.description,
            format:this.form.format,

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
