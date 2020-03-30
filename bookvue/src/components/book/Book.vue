<template>
  <div>
    <div>
      <div>
        <el-input
                style="margin:0px  20px 20px 20px;float:left;width: 200px"
                   placeholder="通过书名查找"
                v-model="bookname"
                prefix-icon="el-icon-search"></el-input>
      </div>
      <div>
        <el-button v-on:click="searchbook" style="margin:0px  20px 0px 0px;float:left" icon="el-icon-search">查询</el-button>
      </div>

      <el-select v-model="value" placeholder="按图书类别查询" style="margin:0px 20px 0px;float:left" >
        <el-option
          v-for="item in category"
          :key="item.id"
          :label="item.name"
          :value="item.id"
        >
        </el-option>
      </el-select>
      <div>
        <el-button v-on:click="listbycategory" style="margin:0px  20px 0px 0px;float:left" icon="el-icon-search">查询</el-button>
      </div>

    </div>

    <EditForm @onSubmit="loadBooks()" ref="edit" ></EditForm>
    <el-button type="text" @click="dialogVisible = true" ></el-button>

  <el-card style="margin: 10px 2%;">

  <el-table
    :data="books.slice((currentPage-1)*pageSize,currentPage*pageSize)"
    style="margin: 10px 2%;"
    stripe
    size="small"
    border>
    <el-table-column
      prop="id"
      label="id"
      width="35">
    </el-table-column>
    <el-table-column
      prop="title"
      label="书名"
      width="200">
    </el-table-column>

    <el-table-column
      prop="auther"
      label="作者"
      width="80">
    </el-table-column>
    <el-table-column
      prop="category.name"
      label="种类"
      width="80">
    </el-table-column>
    <el-table-column
      prop="sellprice"
      label="售价"
      sortable
      width="70">
    </el-table-column>
    <el-table-column
      prop="purchaseprice"
      label="进货价"
      sortable
      width="80">
    </el-table-column>
    <el-table-column
      prop="stock"
      label="库存"
      sortable
      width="70">
    </el-table-column>
    <el-table-column
      prop="press.name"
      label="出版社"
      fit>
    </el-table-column>
    <el-table-column
      prop="format"
      label="开本"
      fit>
    </el-table-column>
    <el-table-column
      prop="sale"
      label="销量"
      sortable
      fit>
    </el-table-column>
    <el-table-column
      prop="lowstock"
      label="库存下限"
      fit>
    </el-table-column>
    <el-table-column
      prop="description"
      label="描述"
      fit>
    </el-table-column>
    <el-table-column
      fixed="right"
      label="操作"
      width="150">
      <template slot-scope="scope">
    <el-button @click.native.prevent="editBook(scope.row)"
               type="text"
               size="small">编辑书籍</el-button>
        <el-button @click.native.prevent="deletebook(scope.row)"
                   type="text"
                   size="small"> 删除书籍</el-button>
      </template>
    </el-table-column>

    </el-table>
    <el-pagination
      @size-change="handleSizeChange"
      @current-change="handleCurrentChange"
      :current-page="currentPage"
      :page-sizes="[10, 20, 30, 50, 100]"
      layout="total, sizes, prev, pager, next, jumper"
      :total="books.length">
    </el-pagination>
    </el-card>
  </div>

</template>

<script>
  import EditForm from "./EditForm";
    export default {
        name: "Book",
      components:{EditForm},
      data(){
          return{
            books: [],
            category: [],
            value:'',
            press: [],
            currentPage: 1,
            pageSize: 10,
            bookname:''
          }
      },
      mounted:function(){
          this.loadBooks()
          this.loadcategory()
          this.listpress()

      },
      methods:{
        loadBooks () {
          var _this = this
          this.$axios.get('/book').then(resp => {
              _this.books = resp.data
          })
        },
        editBook (item) {
          this.$refs.edit.dialogFormVisible = true
          this.$refs.edit.form = {
            id: item.id,
            purchaseprice:item.purchaseprice,
            sale:item.sale,
            sellprice:item.sellprice,
            isbn:item.isbn,
            stock: item.stock,
            title: item.title,
            auther: item.auther,
            lowstock:item.lowstock,
            press: {
              id: item.press.id,
              name:item.press.name
            },
            description: item.description,
            format: item.format,
            category: {
              id: item.category.id,
              name: item.category.name
            }
          }
          // this.$refs.edit.category = {
          //   id: item.category.id.toString()
          // }
        },
        loadcategory(){
          this.$axios.get('/category').then(resp=>{
            this.category=resp.data
          })
        },
        searchbook () {
          var _this = this
          this.$axios
                  .post('/book/search', {
                    keywords: this.bookname
                  }).then(resp => {
            if (resp && resp.status === 200) {
              _this.books = resp.data
            }
          })
        },

        listbycategory(){
          var cid=this.value
          var url='/categories/'+cid+'/book'
          this.$axios.get(url).then(resp=>{
            this.books=resp.data
          })

        },
        listpress(){
          this.$axios.get('/press').then(resp=>{
            this.press=resp.data
          })
        },
        deletebook(item){
          this.$confirm('是否删除此订书籍？', '提示', {
            confirmButtonText: '确定',
            cancelButtonText: '取消',
            type: 'warning'
          }).then(() => {
          var bookid=item.id;
          var url='/book/delete/'+bookid
          this.$axios.delete(url).then(resp=>{
            this.loadBooks()
          })
          }).catch(() => {
            this.$message({
              type: 'info',
              message: '已取消'
            })
          })
        },
        handleSizeChange(val) {
          this.pageSize = val;
        },
        // 当前页
        handleCurrentChange(val) {
          this.currentPage = val;
        }
      }
    }
</script>

<style scoped>

</style>
