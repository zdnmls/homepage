<template>
    <Index>
        <div class="biji">
            <h2 style="padding: 20px 0">&nbsp;&nbsp;<Icon type="ios-flower"></Icon>&nbsp;&nbsp;&nbsp;&nbsp;我的作品</h2>
            <ul class="nr-biao">
                <li v-for="v in displayData">
                    <a :href="v.url" target="_Blank" @click="liu({ids:v.id,pa:v.pages})">
                        <div class="nr-img">
                            <img :src="v.imgs" alt="">
                            <ul class="nr-fdbox">
                                <span  class="nr-fd">{{v.card}}</span>
                            </ul>
                        </div>
                        <div class="nr-title">{{v.name}}</div>
                        <div class="nr-nl">
                            <span><Icon type="android-laptop"></Icon>&nbsp;&nbsp;{{v.class}}</span>&nbsp;&nbsp; <span><Icon type="eye"></Icon>&nbsp;&nbsp;{{v.pages}}</span>
                        </div>
                        <p class="nr-jj">{{v.content}}</p>
                    </a>
                </li>
            </ul>
        </div>
        <div class="bj-page">
            <Page :total="total" size="small" show-elevator show-total @on-change="page1" :page-size="8"></Page>

        </div>
    </Index>
</template>

<script>
    import Index from './index.vue'
    export default {
        name: "demo",
        components:{Index},
        data() {
            return {
                tableData: [],
                pageNumber:1,

            }
        },
        computed:{
            displayData(){
                let start = (this.pageNumber - 1) * 8;
                let end = (this.pageNumber * 8);
                return this.tableData.slice(start,end);
            },
            total(){
                return this.tableData.length;
            }
        },
        mounted: function () {
            fetch('/api/demos').then(r => r.json()).then(v => {
                this.tableData = v
            });
        },
        methods: {
            formatter(row, column) {
                return row.address;
            },
            filterTag(value, row) {
                return row.tag === value;
            },
            filterHandler(value, row, column) {
                const property = column['property'];
                return row[property] === value;
            },
            page1(r){
                this.pageNumber=r
            },
            liu(s){
                fetch('/api/demos_liu?pa=' + s.pa + '&ids=' + s.ids).then(r => r.json()).then(v => {
                    this.tableData = v
                });
            }
        }
    }
</script>

<style scoped>
    .nr-biao{
        width: 100%;
        display: flex;
        flex-wrap: wrap;
        /*background: palegoldenrod;*/
    }
    .nr-biao li{
        width: 205px;
        height: 256px;
        margin: 5px 0 20px 20px;
    }
    .nr-img{
        width: 100%;
        height: 120px;
        background: #b3b27e;
        border-radius: 15px;
        position: relative;
        cursor:pointer;
        overflow: hidden;
    }
    .nr-img img{
        width: 100%;
        height: 100%;
    }
    .nr-fdbox{
        position: absolute;
        bottom: 10px;
        left:10px;
    }
    .nr-fd{
        padding: 5px 8px;
        border-radius: 50px;
        background: rgba(0,0,0,0.3);
        color: white;
        font-size: 12px;
    }
    .nr-title{
        font-size: 16px;
        overflow: hidden;
        text-overflow:ellipsis;
        white-space: nowrap;
        margin: 10px 8px;
        color: #444;
        cursor:pointer
    }
    .nr-title:hover{
        color: #8ad2fb;
    }
    .nr-nl{
        display: flex;
        justify-content: flex-start;
        align-items: center;
    }
    .nr-nl span{
        font-size: 12px;
        padding: 0 8px;
        color: #999;
        cursor:pointer
    }
    .nr-jj{
        font-size: 12px;
        display: -webkit-box;
        -webkit-box-orient: vertical;
        -webkit-line-clamp: 2;
        overflow: hidden;
        margin: 10px 8px;
        color: #a7a7a7;
        cursor:pointer
    }
    .bj-page{
        width: 100%;
        display: flex;
        justify-content: flex-end;
    }
</style>