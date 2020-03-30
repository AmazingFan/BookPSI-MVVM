<template>
    <div>
      <v-chart  :options="pi"/>
    </div>
</template>

<script>
  import ECharts from 'vue-echarts'

    export default {
        name: "Pie",
      components: {
        'v-chart': ECharts,
      },
      data(){
          return{
            pi : {
              title: {
                text:'总销量图',
                subtext:'473天',
                x:'center',
                y:'top',
              },
              tooltip: {
                trigger: 'item',
                formatter: '{a} <br/>{b}: {c} ({d}%)'
              },
              legend: {
                orient: 'vertical',
                left: 1,
                data: ['文学', '少儿', '工具', '编程', '经济', '视频广告', '社科', '历史', '小说', '其他']
              },
              series: [
                {
                  name: '销量',
                  type: 'pie',
                  selectedMode: 'single',
                  radius: [, '30%'],

                  label: {
                    position: 'inner'
                  },
                  labelLine: {
                    show: false
                  },
                  data: [
                    {value: 335, name: '文学', selected: true},
                    {value: 679, name: '少儿'},
                    {value: 1548, name: '工具'}
                  ]
                },
                {
                  name: '销量',
                  type: 'pie',
                  radius: ['40%', '55%'],
                  label: {
                    formatter: '{a|{a}}{abg|}\n{hr|}\n  {b|{b}：}{c}  {per|{d}%}  ',
                    backgroundColor: '#eee',
                    borderColor: '#aaa',
                    borderWidth: 1,
                    borderRadius: 4,
                    // shadowBlur:3,
                    // shadowOffsetX: 2,
                    // shadowOffsetY: 2,
                    // shadowColor: '#999',
                    // padding: [0, 7],
                    rich: {
                      a: {
                        color: '#999',
                        lineHeight: 22,
                        align: 'center'
                      },
                      // abg: {
                      //     backgroundColor: '#333',
                      //     width: '100%',
                      //     align: 'right',
                      //     height: 22,
                      //     borderRadius: [4, 4, 0, 0]
                      // },
                      hr: {
                        borderColor: '#aaa',
                        width: '100%',
                        borderWidth: 0.5,
                        height: 0
                      },
                      b: {
                        fontSize: 1,
                        lineHeight: 3
                      },
                      per: {
                        color: '#eee',
                        backgroundColor: '#334455',
                        padding: [2, 4],
                        borderRadius: 2
                      }
                    }
                  },
                  data: [
                    {value: 335, name: '文学'},
                    {value: 310, name: '少儿'},
                    {value: 234, name: '工具'},
                    {value: 135, name: '编程'},
                    {value: 1048, name: '经济'},
                    {value: 251, name: '社科'},
                    {value: 147, name: '历史'},
                    {value: 102, name: '小说'}
                  ]
                }
              ]
            }
          }
      }
    }
</script>

<style scoped>

</style>
