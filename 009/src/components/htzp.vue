<template>
    <Htmb>
        <Table border :columns="columns7" :data="displayData" stripe></Table>
        <div class="pages">
            <Page :total="total" show-elevator show-total @on-change="page1"></Page>

        </div>
    </Htmb>
</template>

<script>
    import Htmb from './htmb.vue'
    export default {
        name: "htzy",
        data () {
            return {
                columns7: [
                    {
                        title: 'ID',
                        key: 'id',
                        width: 70,
                        align:"center"
                    },
                    {
                        title: '作品名',
                        key: 'name',
                        width: 150,
                    },
                    {
                        title: '简介',
                        key: 'content',
                        width: 250,
                    },
                    {
                        title: '卡片',
                        key: 'card',
                        width: 80,

                    },
                    {
                        title: '分类',
                        key: 'class',
                        width: 80,

                    },
                    {
                        title: '浏览量',
                        key: 'pages',
                        width: 80,
                        align:"center"


                    },
                    {
                        title: '地址',
                        key: 'url',
                        width: 200,
                    },
                    {
                        title: '时间',
                        key: 'times'
                    },
                    {
                        title: '操作',
                        key: 'action',
                        width: 150,
                        align: 'center',
                        render: (h, params) => {
                            return h('div', [
                                h('Button', {
                                    props: {
                                        type: 'primary',
                                        size: 'small'
                                    },
                                    style: {
                                        marginRight: '5px'
                                    },
                                    on: {
                                        click: () => {
                                            this.show(params.index)
                                        }
                                    }
                                }, '查看'),
                                h('Button', {
                                    props: {
                                        type: 'error',
                                        size: 'small'
                                    },
                                    on: {
                                        click: () => {
                                            this.remove(params.row)
                                        }
                                    }
                                }, '删除')
                            ]);
                        }
                    }
                ],
                data6: [],
                pageNumber:1,

            }
        },
        computed:{
          displayData(){
              let start = (this.pageNumber - 1) * 10;
              let end = (this.pageNumber * 10);
              return this.data6.slice(start,end);
          },
          total(){
              return this.data6.length;
          }
        },
        methods: {
            show (index) {
                this.$Modal.info({
                    title: '作品详情',
                    content: `作品：${this.data6[index].name}<br>简介：${this.data6[index].content}<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${this.data6[index].class}&nbsp;&nbsp;${this.data6[index].card}<br>地址：${this.data6[index].url}`
                })
            },
            remove (row) {
                // this.data6.splice(index, 1);
                let ids = row.id;
                fetch('/api/demos_del?id='+ids).then(r=>r.json()).then(r=>this.data6 =r)
            },
            page1(r){
                this.pageNumber=r
            }
        },
        components:{Htmb},
        mounted(){
            fetch('/api/demos').then(r=>r.json()).then(r=>this.data6 =r)
        }
    }

</script>

<style scoped>
    .pages{
        margin: 20px 0;
        float: right;
    }
</style>