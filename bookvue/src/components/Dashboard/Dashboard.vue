<template>
  <div>

  <el-row gutter="40">
    <el-col :span="6"><div class="grid-content bg-purple"><el-card style="size: auto">
      <el-tooltip content="开发中" placement="top">
      <div>
      <i class="el-icon-s-comment"></i>
      信息
    </div>
      </el-tooltip>
    </el-card></div></el-col>
    <el-col :span="6"><div class="grid-content bg-purple-light"><el-card style="size: auto">
      <el-tooltip  content="开发中" placement="top">
      <div>
      <i class="el-icon-delete"></i>
      邮件
    </div>
    </el-tooltip>
    </el-card></div></el-col>
    <el-col :span="6"><div class="grid-content bg-purple"><el-card style="size: auto">
      <el-tooltip  content="开发中" placement="top">
        <div>
      <i class="el-icon-document-copy"></i>
      资讯
        </div>
      </el-tooltip>
    </el-card></div></el-col>
    <el-col :span="6"><div class="grid-content bg-purple-light"><el-card style="size: auto">
      <el-tooltip  content="开发中" placement="top">
        <div>
      <i class="el-icon-document"></i>
      报表
    </div>
      </el-tooltip>
    </el-card></div></el-col>
  </el-row >

    <el-row gutter="20">
      <div style="height: 30px"></div>
      <el-col :span="13" >
        <div class="grid-content bg-purple"><el-card  style="width: 100%;height:100%;" ><v-chart  :options="p"/></el-card></div></el-col>
      <el-col :span="11">
        <div class="grid-content bg-purple"><el-card  style="width: 100%;height:100%;" ><Pie></Pie></el-card></div></el-col>
    </el-row>


    <el-row gutter="20">
      <div style="height: 30px"></div>
  <el-col span="12">

<!--    <el-carousel :interval="4000" type="card" height="400px">-->
<!--              <el-carousel-item v-for="item in imagesbox" :key="item.id">-->
<!--                 <img :src="item.idView" class="image">-->
<!--              </el-carousel-item>-->
<!--            </el-carousel>-->
    <el-card>
    <div class="block">
      <el-timeline>
        <el-timeline-item timestamp="2020/2/1" placement="top">
          <el-card>
            <h4>录入库存</h4>
            <p>王小虎 提交于 2020/2/1 20:46</p>
          </el-card>
        </el-timeline-item>
        <el-timeline-item timestamp="2020/1/13" placement="top">
          <el-card>
            <h4>进行人事变动</h4>
            <p>老板 提交于 2020/1/13 20:46</p>
          </el-card>
        </el-timeline-item>
        <el-timeline-item timestamp="2020/2/22" placement="top">
          <el-card>
            <h4>进行销售操作</h4>
            <p>世繁华 提交于 2020/2/22 20:46</p>
          </el-card>
        </el-timeline-item>
      </el-timeline>
    </div>
    </el-card>
  </el-col>
      <el-col span="12">
    <el-card>
      <div><i class="el-icon-message-solid"></i> 库存报警</div>
      <el-table :data="lowbooks"
                style="margin: 10px 2%;"
                stripe
                size="small"
                border>
        <el-table-column
          prop="id"
          label="id"
          width="100"
          ></el-table-column>
        <el-table-column
          prop="title"
          label="书名"
          width="240"
        ></el-table-column>
        <el-table-column
          prop="lowstock"
          label="库存预警值"
          width="100"
        ></el-table-column>
        <el-table-column
          prop="stock"
          label="当前库存"
          width="100"
        ></el-table-column>
      </el-table>

    </el-card>

      </el-col>
    </el-row>
  </div>
</template>

<script>
  import ECharts from 'vue-echarts'
  import 'echarts/lib/chart/line'
  import 'echarts/lib/component/polar'
  import 'echarts/lib/chart/pie'
  import 'echarts/lib/chart/bar'
  import 'echarts/lib/component/tooltip'
  import 'echarts/lib/component/legend'
  import 'echarts/lib/component/title'
  import Pie from "./Pie";
    export default {
        name: "Dashboard",
      components: {
        'v-chart': ECharts,
        Pie
      },
      data(){
          return{
            lowbooks:[],
            imagesbox:[{id:0,idView:require("../../assets/timg.jpeg")},   
                {id:1,idView:require("../../assets/bg1.jpg")},
              {id:2,idView:require("../../assets/logo.png")}],

            p : {
              title: {
                text: '星期销量图   '
              },
              tooltip: {
                trigger: 'axis',
                axisPointer: {
                  type: 'cross',
                  label: {
                    backgroundColor: '#6a7985'
                  }
                },
              },
              legend: {
                data: ['少儿读物', '社科', '文学', '工具', '经济']
              },
              toolbox: {
                feature: {
                  saveAsImage: {}
                }
              },
              grid: {
                left: 0,
                right: 10,
                bottom: 0,
                top: 30,


                containLabel: true
              },
              xAxis: [
                {
                  type: 'category',
                  boundaryGap: false,


                  data: ['周一', '周二', '周三', '周四', '周五', '周六', '周日']
                }
              ],
              yAxis: [
                {
                  type: 'value'
                }
              ],
              series: [
                {
                  name: '少儿读物',
                  type: 'line',
                  stack: '总量',
                  areaStyle: {},
                  data: [120, 132, 101, 134, 90, 230, 210]
                },
                {
                  name: '社科',
                  type: 'line',
                  stack: '总量',
                  areaStyle: {},
                  data: [220, 182, 191, 234, 290, 330, 310]
                },
                {
                  name: '文学',
                  type: 'line',
                  stack: '总量',
                  areaStyle: {},
                  data: [150, 232, 201, 154, 190, 330, 410]
                },
                {
                  name: '工具',
                  type: 'line',
                  stack: '总量',
                  areaStyle: {},
                  data: [320, 332, 301, 334, 390, 330, 320]
                },
                {
                  name: '经济',
                  type: 'line',
                  stack: '总量',
                  label: {
                    normal: {
                      show: true,
                      position: 'top'
                    }
                  },
                  areaStyle: {},
                  data: [820, 932, 901, 934, 1290, 1330, 1320]
                }
              ]
            }


      }
      },
      mounted:function(){
        this.loadlowbook()

      },
      methods:{
        loadlowbook(){
          var _this=this
          _this.$axios.get('/book/low').then(resp=>{
            this.lowbooks=resp.data
          })
        }
      }
    }
</script>

<style scoped>

</style>
