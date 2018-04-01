<template>
    <Index>
        <div class="biji">
            <h2 style="padding: 20px 0">&nbsp;&nbsp;<Icon type="search"></Icon>&nbsp;&nbsp;&nbsp;搜索结果</h2>
            <ul class="bj-box">
                <li v-for="v in tableData">
                    <router-link :to="{ name: 'Nrxq',query:{id:v.id,pa:v.pages}}">
                        <div class="bj-hz">
                            <span class="bj-sp">{{v.nub}}</span>
                            <div class="bj-sp2">{{v.name}}</div>
                            <div class="bj-sp6" style="font-size: 12px;color: #939497;width: 150px;">{{v.times}}</div>
                            <span class="bj-sp3"><Icon type="eye"></Icon>&nbsp;&nbsp; {{v.pages}} </span>
                            <span class="bj-sp4"><Tag>{{v.card}}</Tag></span>
                        </div>
                    </router-link>
                </li>
            </ul>
        </div>
        <div class="bj-page">
            <Page :total="total" size="small" show-elevator show-total @on-change="page1"></Page>

        </div>
    </Index>
</template>

<script>
    import Index from './index.vue'
    export default {
        name: "gxsb",
        components:{Index},
        data() {
            return {
                tableData: [],
                pageNumber:1,
            }
        },
        computed:{
            displayData(){
                let start = (this.pageNumber - 1) * 10;
                let end = (this.pageNumber * 10);
                return this.tableData.slice(start,end);
            },
            total(){
                return this.tableData.length;
            }
        },
        created() {
            this.ids = this.$route.query.val;
        },
        mounted: function () {
            fetch('/api/notes_sou?sou='+ this.ids).then(r => r.json()).then(v => {
                if(v.length == 0){
                    this.$Message.error('对不起，暂无数据！');
                    this.tableData = []

                } else {
                    this.tableData = v
                }
            });
        },
        watch:{
            $route(){
                this.ids = this.$route.query.val;
                fetch('/api/notes_sou?sou='+ this.ids).then(r => r.json()).then(v => {
                    if(v.length == 0){
                        this.$Message.error('对不起，暂无数据！');
                        this.tableData = []
                    } else {
                        this.tableData = v
                    }
                });
            }

        },
        methods: {
            page1(r){
                this.pageNumber=r
            }
        }
    }
</script>

<style scoped>
    a{
        color: #475669;
    }
    .bj-box{
        width: 100%;
        height: auto;
    }
    .bj-box li{
        width: 100%;
        height: 50px;
        border-bottom: 1px solid #e9eaec;
    }
    .bj-box li:hover{
        background: #edf8e9;
    }
    .bj-box li:hover a{
        color: #98d1d1;
    }
    .bj-hz{
        width: 100%;
        height: 100%;
        display: flex;
        align-items: center;
    }
    .bj-sp{
        padding: 0 35px 0 100px;
        font-size: 16px;
    }
    .bj-sp2{
        width: 350px;
        height: 100%;
        display: flex;
        align-items: center;
        font-size: 16px;
    }
    .bj-sp3{
        width: 100px;
        height: 100%;
        display: flex;
        align-items: center;
        color: #a7a7a7;

    }
    .bj-sp4{
        font-size: 16px;
    }
    .bj-page{
        width: 100%;
        display: flex;
        justify-content: flex-end;
    }
</style>