<template>
    <Index>
        <div class="biji">
            <h2 style="padding: 20px 0">&nbsp;&nbsp;<Icon type="ios-flower"></Icon>&nbsp;&nbsp;&nbsp;最新作品</h2>
            <el-carousel :interval="4000" type="card" height="200px">
                <el-carousel-item v-for="b in bannerData" :key="b.id" :label="b.name">
                    <a :href="b.url" target="_Blank" @click="liu({ids:b.id,pa:b.pages})">
                    <img :src="b.imgs" alt="" style="width: 100%;vertical-align:middle;">
                    </a>
                </el-carousel-item>
            </el-carousel>
        </div>

        <div class="biji">
            <h2 style="padding: 20px 0">&nbsp;&nbsp;<Icon type="document-text"></Icon>&nbsp;&nbsp;&nbsp;&nbsp;最新笔记</h2>
            <ul class="bj-box">
                <li v-for="v in displayData">
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

    </Index>
</template>

<script>
    import Index from './index.vue'
    export default {
        name: "zhuye",
        components:{Index},
        data() {
            return {
                tableData: [],
                banData:[]
            }
        },
        computed: {
            displayData() {
                return this.tableData.slice(0, 5);
            },
            bannerData() {
                return this.banData.slice(0, 5);
            },
        },
        mounted: function () {
            fetch('/api/demos').then(r => r.json()).then(v => {
                this.banData = v
            });
            fetch('/api/notes2').then(r => r.json()).then(v => {
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
            liu(s){
                fetch('/api/demos_liu?pa=' + s.pa + '&ids=' + s.ids).then(r => r.json()).then(v => {
                    this.tableData = v
                });
            }
        }

    }
</script>

<style scoped>
    .el-carousel__item h3 {
        color: #475669;
        font-size: 14px;
        opacity: 0.75;
        line-height: 200px;
        margin: 0;
    }

    .el-carousel__item:nth-child(2n) {
        background-color: #99a9bf;
    }

    .el-carousel__item:nth-child(2n+1) {
        background-color: #d3dce6;
    }
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
</style>