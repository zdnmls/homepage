<template>
    <Index>
        <div class="biji">

            <div class="xq-xyp">
                <Breadcrumb separator=">">
                    <BreadcrumbItem to="/">主页</BreadcrumbItem>
                    <BreadcrumbItem to="/Biji">我的笔记</BreadcrumbItem>
                    <BreadcrumbItem >{{banData.name}}</BreadcrumbItem>
                </Breadcrumb>
                <div v-on:click="pageshu({ids:bansData.id,pa:bansData.pages,nub:bansData.nub})" class="xyp">下一篇：{{bansData.name}}</div>
            </div>

            <h2 style="padding: 20px 0;border-bottom: 1px solid #e9eaec">&nbsp;&nbsp;<Icon type="document-text"></Icon>&nbsp;&nbsp;&nbsp;&nbsp;内容详情</h2>
                <div class="nr-box">
                    <h3 class="nr_bt">{{banData.name}}</h3>
                    <div class="nr-xx" v-html="banData.content"></div>
                    <div class="nr-time"><span><b>写于： </b>{{banData.times}}</span></div>

                </div>

        </div>
    </Index>
</template>

<script>
    import Index from './index.vue'
    export default {
        name: "nrxq",
        components:{Index},
        data: function () {
            return {
                banData:[],
                bansData:{'name':'没有了'},
                buv:''
            }
        },
        created() {
            this.ids = this.$route.query.id;
            this.pa = this.$route.query.pa;
        },
        mounted: function () {
            fetch('/api/notes_liu?pa=' + this.pa + '&ids=' + this.ids).then(r => r.json()).then(v => {
                v.map((value)=>{
                    // console.log(value)
                    if(value.id == this.ids){
                        this.banData = value;
                        this.buv= value.nub + 1;
                    }
                    if(value.nub == this.buv){
                        this.bansData = value;
                    }
                })
            });
        },
        methods:{
            pageshu(s){
                fetch('/api/notes').then(r => r.json()).then(v => {
                   v.map((value)=>{
                       let su = s.nub + 1;
                       if(value.nub == su){
                          this.bansData = value;
                       }
                       if(su == v.length+1){
                           this.bansData = {'name':'没有了'};

                       }
                   })
                });
                fetch('/api/notes_liu?pa=' + s.pa + '&ids=' + s.ids).then(r => r.json()).then(v => {
                    v.map((value)=>{
                        // console.log(value)
                        if(value.id == s.ids){
                            this.banData = value;
                        }
                        //
                    })


                });
            }
        }
    }
</script>

<style scoped>
    .demo-breadcrumb-separator{
        color: #ff5500;
        padding: 0 5px;
    }
    .nr_bt{
        padding: 20px 0 10px;
        text-align: center;
        font-size: 16px;
    }
    .nr-xx{
        padding: 20px 40px;
        text-align:justify;
        line-height: 30px;
        font-size: 14px;
    }
    .xq-xyp{
        display: flex;
        justify-content: space-between;
    }
    .xyp{
        text-decoration:underline;
        color: #98d1d1;
    }
    .nr-time{
        width: 100%;
        padding-right: 40px;
        box-sizing: border-box;
        display: flex;
        justify-content: flex-end;
        align-items: center;

    }
    .nr-time span{
        color: #98d1d1;
        padding: 5px 0;
        border-bottom: 1px solid #e9eaec;

    }
    /* table 样式 */
    table {
        border-top: 1px solid #ccc;
        border-left: 1px solid #ccc;
    }
    table td,
    table th {
        border-bottom: 1px solid #ccc;
        border-right: 1px solid #ccc;
        padding: 3px 5px;
    }
    table th {
        border-bottom: 2px solid #ccc;
        text-align: center;
    }

    /* blockquote 样式 */
    blockquote {
        display: block;
        border-left: 8px solid #d0e5f2;
        padding: 5px 10px;
        margin: 10px 0;
        line-height: 1.4;
        font-size: 100%;
        background-color: #f1f1f1;
    }

    /* code 样式 */
    code {
        display: inline-block;
        *display: inline;
        *zoom: 1;
        background-color: #f1f1f1;
        border-radius: 3px;
        padding: 3px 5px;
        margin: 0 3px;
    }
    pre code {
        display: block;
    }

    /* ul ol 样式 */
    ul, ol {
        margin: 10px 0 10px 20px;
    }
    img{
        width: 50%!important;
    }
</style>