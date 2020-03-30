<template>
  <div>
    <el-container>
      <el-header>
    <el-input type="text" style="margin: 10px 2%;float: left;width: 300px" v-model="findorderid" placeholder="订单号">
    </el-input>
    <el-button style="margin: 10px 2%;float: left;width: 100px"
               @click="findallorder"
    icon="el-icon-search">
      查找
    </el-button>
      </el-header>
<el-main>
    <el-card style="margin: 10px 2%;">
    <el-table
      :data="findedorder"
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
        width="80"
        :filters="[{ text: '入库', value: 1 }, { text: '出库', value: 0 }]"
        :filter-method="filterTag"
        filter-placement="bottom-end">
        <template slot-scope="scope">
          <el-tag
            :type="scope.row.type === 0 ? 'primary' : 'success'"
            disable-transitions><i :class="scope.row.type === 1 ? 'el-icon-plus' : 'el-icon-minus'"></i></el-tag>
        </template>
      </el-table-column>
      <el-table-column
        sortable
        prop="value"
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
    </el-table>
    </el-card>
</el-main>
    </el-container>
  </div>
</template>

<script>
    export default {
        name: "FindOrder",
      data(){
          return{
           findorderid:'',
            findedorder:[],
            allorder:[]
          }
      },
      mounted:function(){
        this.listallorder()
      },
      methods:{
        findorder(){
          var orderid=this.findorderid
          var url='/order/find/'+orderid
          this.$axios.get(url).then(resp=>{
            this.findedorder.push(resp.data)
          })
        },
        findallorder(){
          var _this=this
          var orderid=_this.findorderid
          for(let i=0;i<_this.allorder.length;i++){
            if(orderid == _this.allorder[i].id){
              _this.findedorder.push(_this.allorder[i])
              }


          }
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
        resetDateFilter() {
          this.$refs.filterTable.clearFilter('date');
        },
        clearFilter() {
          this.$refs.filterTable.clearFilter();
        },
        formatter(row, column) {
          return row.address;
        },
        filterTag(value, row) {
          return row.type === value;
        },
        filterHandler(value, row, column) {
          const property = column['property'];
          return row[property] === value;
        },
        listallorder(){
          var _this=this
          _this.$axios.get('/order').then(resp=>{
            this.allorder=resp.data
          })
        }
      }
    }
</script>

<style scoped>

</style>
