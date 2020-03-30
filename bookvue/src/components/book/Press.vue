<template>
  <div>


      <PressEditForm @onSubmit="loadPress"  ref="pressedit"></PressEditForm>

    <el-card style="margin: 18px 2%;width: 95%">
    <el-table
      :data="press.slice((currentPage-1)*pageSize,currentPage*pageSize)"
      :show-header="true"
      style="width: 100%; overflow-y: auto;"
    >
      <el-table-column
        prop="id"
        label="序号"
        width="100"
        align="center">
      </el-table-column>
      <el-table-column
        prop="name"
        label="名字"
        align="center">
      </el-table-column>
      <el-table-column
        prop="principal"
        label="负责人"
        align="center">
      </el-table-column>
      <el-table-column
        prop="phone"
        label="电话号"
        align="center"
      >
      </el-table-column>
      <el-table-column
        prop="address"
        label="地址"
        align="center">
      </el-table-column>
      <el-table-column
        prop="email"
        label="电子邮箱"
        align="center">
      </el-table-column>
      <el-table-column
        label="操作"
        width="120">
        <template slot-scope="scope">
          <el-button
            @click.native.prevent="editPress(scope.row)"
            type="text"
            size="small">
            编辑
          </el-button>
          <el-button
            @click="deletepress(scope.row)"
            type="text"
            size="small">
            移除
          </el-button>
        </template>
      </el-table-column>
    </el-table>


    <el-pagination
      @size-change="handleSizeChange"
      @current-change="handleCurrentChange"
      :current-page="currentPage"
      :page-sizes="[10, 20, 30, 50, 100]"
      layout="total, sizes, prev, pager, next, jumper"
      :total="press.length">
    </el-pagination>
    </el-card>


  </div>
</template>

<script>
  import PressEditForm from "./PressEditForm";
    export default {
        name: "Press",
      components:{PressEditForm},
      data(){
        return{
          press: [],
          currentPage: 1,
          pageSize: 10
        }
      },
      mounted:function(){
        this.loadPress()
      },
      methods:{
        loadPress () {
          var _this = this
          this.$axios.get('/press').then(resp => {
            _this.press = resp.data
          })
        },
        handleSizeChange(val) {
          this.pageSize = val;
        },
        // 当前页
        handleCurrentChange(val) {
          this.currentPage = val;
        },
        editpress (press) {
          this.dialogFormVisible = true
          this.selectedUser = user
          let roleIds = []
          for (let i = 0; i < user.roles.length; i++) {
            roleIds.push(user.roles[i].id)
          }
          this.selectedRolesIds = roleIds
        },
        deletepress(item){

          this.$confirm('是否删除此出版社？', '提示', {
            confirmButtonText: '确定',
            cancelButtonText: '取消',
            type: 'warning'
          }).then(() => {

          var pressid=item.id;
          var url='/press/delete/'+pressid
          this.$axios.delete(url).then(resp=>{
            this.$alert('删除出版社信息成功')
            this.loadPress()
          })

        }).catch(() => {
      this.$message({
        type: 'info',
        message: '已取消'
      })
    })
        },
        editPress (item) {
          this.$refs.pressedit.dialogFormVisible = true
          this.$refs.pressedit.form = {
            id: item.id,
            name:item.name,
            principal:item.principal,
            phone:item.phone,
            address:item.address,
            email:item.email
          }
          // this.$refs.edit.category = {
          //   id: item.category.id.toString()
          // }
        }
      }
    }
</script>

<style scoped>

</style>
