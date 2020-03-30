<template>
  <div>
    <el-card style="margin: 10px 2%;">
      <el-table
        :data="order.slice((currentPage-1)*pageSize,currentPage*pageSize)"
        style="margin: 18px 2%;width: 95%"
        stripe
      >
        <el-table-column type="expand">
          <template slot-scope="props">
            <el-table
              :data="props.row.orderBooks"
              size="mini">
              <el-table-column
                prop="id"
                label="id"
                width="50">
              </el-table-column>
              <el-table-column
                prop="book.title"
                label="标题"
                width="200">
              </el-table-column>
              <el-table-column
                prop="book.purchaseprice"
                label="批发价"
                width="200">
              </el-table-column>
              <el-table-column
                prop="amount"
                label="数量"
                width="200">
              </el-table-column>
              <el-table-column
                prop="price"
                label="总价"
                width="200">
              </el-table-column>

            </el-table>
          </template>
        </el-table-column>
        <el-table-column
          prop="id"
          label="id"
          width="60">
        </el-table-column>

        <el-table-column
          prop="serialid"
          label="订单号"
          fit>
        </el-table-column>
        <el-table-column
          prop="status"
          label="状态"
          width="80">
        </el-table-column>
        <el-table-column
          prop="type"
          label="种类"
          width="80">
          销售出库
        </el-table-column>
        <el-table-column
          prop="value"
          sortable
          label="总价"
          width="80">
        </el-table-column>
        <el-table-column
          sortable
          label="下单时间"
          width="200">
          <template slot-scope="slot">
            {{timestampToTime(slot.row.createtime)}}
          </template>
        </el-table-column>
        <el-table-column label="操作">
          <template slot-scope="scope">
            <el-button
              size="mini"
              type="danger"
              @click="deleteorder(scope.row)" icon="el-icon-delete">删除</el-button>

          </template>
        </el-table-column>
      </el-table>
      <el-pagination
        @size-change="handleSizeChange"
        @current-change="handleCurrentChange"
        :current-page="currentPage"
        :page-sizes="[10, 20, 30, 50, 100]"
        layout="total, sizes, prev, pager, next, jumper"
        :total="order.length">
      </el-pagination>
    </el-card>

  </div>
</template>

<script>
  import OrderIndex from "./OrderIndex";
    export default {
        name: "Sale",
      data(){
          return{
            order:[
            ],
            currentPage: 1,
            pageSize: 10

          }
      },
      mounted:function () {
        this.listorder()
      },
      methods:{
        listorder(){
          var _this=this
          _this.$axios.get('/order/0').then(resp=>{
            this.order=resp.data
          })
        },
        deleteorder(item){
          this.$confirm('是否删除此订单？', '提示', {
            confirmButtonText: '确定',
            cancelButtonText: '取消',
            type: 'warning'
          }).then(() => {
            var orderid = item.id;
            var url = '/order/delete/' + orderid
            this.$axios.delete(url).then(resp => {
              this.listorder()
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
        },
        timestampToTime (cjsj) {
          var date = new Date(cjsj) //时间戳为10位需*1000，时间戳为13位的话不需乘1000
          var Y = date.getFullYear() + '-'
          var M = (date.getMonth()+1 < 10 ? '0'+(date.getMonth()+1) : date.getMonth()+1) + '-'
          var D = date.getDate() + ' '
          var h = date.getHours() + ':'
          var m = date.getMinutes() + ':'
          var s = date.getSeconds()
          return Y+M+D+h+m+s
        },
        returnorder(item){
          this.$confirm('是否退掉此订单？', '提示', {
            confirmButtonText: '确定',
            cancelButtonText: '取消',
            type: 'warning'
          }).then(() => {

            var orderid = item.id;
            var url = '/order/return/' + orderid
            this.$axios.put(url).then(resp => {
              this.listorder()
            })

          }).catch(() => {
            this.$message({
              type: 'info',
              message: '已取消'
            })
          })
        }
      }
    }
</script>

<style scoped>

</style>
