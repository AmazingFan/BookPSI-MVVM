<template>
  <div>
    <el-dialog
      title="修改用户信息"
      :visible.sync="dialogFormVisible">
      <el-form v-model="selectedUser" style="text-align: left" ref="dataForm">
        <el-form-item label="用户名" label-width="120px" prop="username">
          <label>{{selectedUser.username}}</label>
        </el-form-item>
        <el-form-item label="真实姓名" label-width="120px" prop="name">
          <el-input v-model="selectedUser.realname" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="真实姓名" label-width="120px" prop="name">
          <el-input v-model="selectedUser.realname" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="性别" label-width="120px" prop="gender">
          <el-input v-model="selectedUser.gender" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="手机号" label-width="120px" prop="phone">
          <el-input v-model="selectedUser.phone" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="身份证" label-width="120px" prop="idcard">
          <el-input v-model="selectedUser.idcard" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="密码" label-width="120px" prop="password">
          <el-button type="warning" @click="resetPassword(selectedUser.username)">重置密码</el-button>
        </el-form-item>
        <el-form-item label="角色分配" label-width="120px" prop="roles">
          <el-checkbox-group v-model="selectedRolesIds">
            <el-checkbox v-for="(role,i) in roles" :key="i" :label="role.id">{{role.zhname}}</el-checkbox>
          </el-checkbox-group>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false">取 消</el-button>
        <el-button type="primary" @click="onSubmit(selectedUser)">确 定</el-button>
      </div>
    </el-dialog>


    <UserAdd></UserAdd>
    <el-button type="text" @click="dialogVisible = true" ></el-button>
    <el-card style="margin: 18px 2%;width: 95%">
    <el-table
      :data="users.slice((currentPage-1)*pageSize,currentPage*pageSize)"
      style="width: 100% "
      stripe

    >
      <el-table-column
        prop="id"
        label="id"
        width="100">
      </el-table-column>
      <el-table-column
        prop="account"
        label="账户"
        width="100">
      </el-table-column>
      <el-table-column
        prop="username"
        label="用户名"
        width="100">
      </el-table-column>
      <el-table-column
        prop="realname"
        label="名字"
        width="100">
      </el-table-column>
      <el-table-column
        prop="gender"
        label="性别"
        width="100">
      </el-table-column>
      <el-table-column
        prop="address"
        label="地址"
        width="100">
      </el-table-column>
      <el-table-column
        prop="phone"
        label="电话"
        width="100">
      </el-table-column>
      <el-table-column
        prop="idcard"
        label="身份证号码"
        width="180">
      </el-table-column>
      <el-table-column
        label="状态"
        sortable
        width="100">
        <template slot-scope="scope">
          <el-switch
            v-model="scope.row.enabled"
            active-color="#13ce66"
            inactive-color="#ff4949"
            @change="(value) => commitStatusChange(value, scope.row)">
          </el-switch>
        </template>
      </el-table-column>


      <el-table-column
        label="操作"
        width="120">
        <template slot-scope="scope">
          <el-button
            @click="editUser(scope.row)"
            type="text"
            size="small">
            编辑
          </el-button>
          <el-button
            @click="deleteuser(scope.row)"
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
        :total="users.length">
      </el-pagination>
    </el-card>
  </div>
</template>

<script>
  import UserAdd from "./UserAdd";
    export default {
        name: "User",
      components:{UserAdd},
      mounted:function() {
        this.listUsers()
        this.listRoles()
      },
      data(){
          return{
            users: [],
            roles: [],
            dialogFormVisible: false,
            selectedUser: [],
            selectedRolesIds: [],
            currentPage: 1,
            pageSize: 10
          }
      },
      methods:{

        listUsers () {
          var _this = this
          this.$axios.get('/user').then(resp => {
            if (resp && resp.status === 200) {
              _this.users = resp.data
            }
          })
        },
        listRoles () {
          var _this = this
          this.$axios.get('/role').then(resp => {
            if (resp && resp.status === 200) {
              _this.roles = resp.data
            }
          })
        },
        commitStatusChange (value, user) {
          if (user.username !== 'admin') {
            this.$axios.put('/user/status', {
              enabled: value,
              username: user.username
            }).then(resp => {
              if (resp && resp.status === 200) {
                if (value) {
                  this.$message('用户 [' + user.username + '] 已启用')
                } else {
                  this.$message('用户 [' + user.username + '] 已禁用')
                }
              }
            })
          } else {
            user.enabled = true
            this.$alert('不能禁用管理员账户')
          }
        },
        onSubmit (user) {
          let _this = this
          // 根据视图绑定的角色 id 向后端传送角色信息
          let roles = []
          for (let i = 0; i < _this.selectedRolesIds.length; i++) {
            for (let j = 0; j < _this.roles.length; j++) {
              if (_this.selectedRolesIds[i] === _this.roles[j].id) {
                roles.push(_this.roles[j])
              }
            }
          }
          this.$axios.put('/user', {
            username: user.username,
            realname: user.realname,
            phone: user.phone,
            idcard: user.idcard,
            address:user.address,
            gender:user.gender,
            roles: roles
          }).then(resp => {
            if (resp && resp.status === 200) {
              this.$alert('用户信息修改成功')
              this.dialogFormVisible = false
              // 修改角色后重新请求用户信息，实现视图更新
              this.listUsers()
            }
          })
        },
        editUser (user) {
          this.dialogFormVisible = true
          this.selectedUser = user
          let roleIds = []
          for (let i = 0; i < user.roles.length; i++) {
            roleIds.push(user.roles[i].id)
          }
          this.selectedRolesIds = roleIds
        },
        deleteuser(item){
          var userid=item.id;
          var url='/user/delete/'+userid
          this.$axios.delete(url).then(resp=>{
            this.listUsers()
          })
        },
        resetPassword (username) {
          this.$axios.put('/user/password', {
            username: username
          }).then(resp => {
            if (resp && resp.status === 200) {
              this.$alert('密码已重置为 123')
            }
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
