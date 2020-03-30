<template>
  <div>
    <el-container>
      <el-header>
    <div>
      <div>
        <el-button type="primary" icon="el-icon-circle-plus-outline" @click="dialogVisible = true" style="margin:0px 20px 0px;float:left">添加书籍
        </el-button>
      </div>

      <div>
        <el-button @click="onsubmit" style="margin:0px  20px 0px 0px;float:left">提交订单<i class="el-icon-position
"></i></el-button>
      </div>
    </div>
      </el-header>
    <el-dialog
      title="要添加的书籍"
      :visible.sync="dialogVisible"
      width="30%"
      :before-close="handleClose"
      @close="clear"
    >
      <el-form  label-width="80px">
        <el-form-item label="书名">
          <el-select v-model="selectedbookid" placeholder="书籍">
            <el-option
              v-for="item in books"
              :key="item.id"
              :value="item.id"
              :label="item.title"
            >
            </el-option>
          </el-select>

        </el-form-item>
        <el-form-item label="数量">
          <el-input v-model="amount" autocomplete="off"></el-input>
        </el-form-item>

      </el-form>
      <span slot="footer" class="dialog-footer">
    <el-button @click="dialogVisible = false">取 消</el-button>
    <el-button type="primary" @click="add()">添加</el-button>
  </span>
    </el-dialog>
      <el-main>
    <el-card style="margin: 18px 2%;width: 95%">
      <el-table
        :data="selectedbooks"
        style="margin: 10px 2%;"
        show-summary>
        <el-table-column
          prop="title"
          label="书籍标题"
          width="300">
        </el-table-column>
        <el-table-column
          prop="amount"
          label="数量"
          width="200">
        </el-table-column>
        <el-table-column
          prop="purchaseprice"
          label="单价"
          width="350">

        </el-table-column>
        <el-table-column
          fixed="right"
          prop="price"
          label="总价"
          width="100">
        </el-table-column>
      </el-table>


    </el-card>
</el-main>
    </el-container>
  </div>
</template>

<script>
  export default {
    name: "SaleOrder",
    data(){
      return{
        books:[],//全部书籍
        selectedbook:[],//当前选中的的书籍
        selectedbookid:[],
        selectedbooks:[],
        dialogVisible: false,
        id:'',
        amount:'',
        price:'',
        status:'1',
        type:'0',
        test:[
        ],
      }
    },
    mounted:function () {
      this.loadBooks()
    },
    methods:{
      loadBooks () {
        var _this = this
        this.$axios.get('/book').then(resp => {
          _this.books = resp.data
        })
      },
      handleClose(done) {
        this.$confirm('确认关闭？')
          .then(_ => {
            done();
          })
          .catch(_ => {});
      },
      clear(){
        this.amount=''
        this.selectedbookid=''

      },
      add() {
        var _this=this
        _this.dialogVisible = false

        for(let i=0;i<_this.books.length;i++){
          if(_this.selectedbookid === _this.books[i].id){
            _this.selectedbook = _this.books[i]
            _this.selectedbooks.push({title:_this.selectedbook.title,
              amount:_this.amount,
              purchaseprice:_this.selectedbook.purchaseprice,
              price:_this.amount*_this.selectedbook.purchaseprice})
          }
        }
        this.test.push({amount:_this.amount,
          price:_this.amount*_this.selectedbook.purchaseprice,
          book:_this.selectedbook})


      },
      onsubmit(){
        let _this = this
        let value=0
        for(let i=0;i<_this.selectedbooks.length;i++){
          value=value+_this.selectedbooks[i].price
        }

        this.$axios.post('/order/submit',{
          id:this.id,
          value: value,
          status:this.status,
          type:this.type,
          orderBooks: this.test
        }).then(resp => {
          if (resp && resp.status === 200) {
            this.$alert('下订单成功')
            this.dialogFormVisible = false
            this.selectedbooks=''
          }
        })
      }
    }

  }
</script>

<style scoped>

</style>
