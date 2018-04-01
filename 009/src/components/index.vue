<template>
    <div style="width: 1200px;margin: 0 auto">
    <Layout>
        <Header class="hed">
            <div class="hed_box">
                <Icon type="ios-pricetags" size="20"></Icon> &nbsp;&nbsp;&nbsp;&nbsp;
                <h3>{{data9.webs}}</h3>&nbsp;&nbsp;&nbsp;&nbsp;
                <Icon type="ios-pricetags" size="20"></Icon>
            </div>
        </Header>
        <div style="display: flex;justify-content: center;padding: 20px;background:#f8f8f9;">

            <template>{{data9.zym}}</template>
        </div>
        <Menu class="bq-box" mode="horizontal"  :active-name="names" @on-select="ckkc">

            <Input v-model="value4" icon="search" placeholder="请输入您要查询的数据..." style="width: 250px;position: absolute;left: 0" @on-click="sousuo"></Input>
            <MenuItem name="/">
                <Icon type="ios-home"></Icon>
                我的主页
            </MenuItem>
            <MenuItem name="Demo">
                <Icon type="ios-flower"></Icon>
                我的作品
            </MenuItem>
            <MenuItem name="Biji">
             <Icon type="ios-paper"></Icon>
                我的笔记
            </MenuItem>
            <!--<MenuItem name="Gxsb">
                <Icon type="person"></Icon>
                我的简历
            </MenuItem>-->
        </Menu>
        <Layout>

            <Sider hide-trigger class="bodi">
                <div class="rili">
                    <div style="padding-left: 40px;padding-bottom: 5px"><Icon type="compass"></Icon>&nbsp;&nbsp;{{dates}}</div>
                    <Calendar
                            isHideOtherday=false
                            :agoDayHide='1514937600000'
                            :futureDayHide='1525104000000'
                    ></Calendar>

                </div>
                <div class="shux">
                    <h4 style="text-align:center; padding-bottom: 5px">
                        <i class="el-icon-loading"></i>&nbsp;&nbsp;个人简介&nbsp;&nbsp;
                        <i class="el-icon-loading"></i>&nbsp;&nbsp;</h4>
                    <div style="width: 100%;height: 180px;overflow: hidden">
                        <img :src="data9.imgs" alt="" style="width: 100%;padding: 15px 40px;">

                    </div>
                    <h5>姓名：{{data9.name}}</h5>
                    <h5>生日：{{data9.times}}</h5>
                    <h5>{{data9.jie}}</h5>
                </div>
            </Sider>

            <Content>
                <div class="kuanjia">
                    <slot/>

                </div>
            </Content>
        </Layout>
        <Footer style=" border-top: 1px solid #dddee1;text-align: center">
            <span>--------&nbsp;&nbsp;  {{data9.fot}}&nbsp;&nbsp;  -------- </span>
        </Footer>
        <BackTop></BackTop>
    </Layout>
    </div>
</template>

<script>
    import moment from 'moment'
    moment.locale('zh-cn');
    export default {
        name: "index",
        data(){
            return{
                dates:'',
                value4:'',
                names:'/',
                data1: [],
                data9: [],
            }
        },
        methods: {
            ckkc(name) {
                this.$router.push(name)
            },
            sousuo(){
                let sou = this.value4.replace(/\s|\xA0/g,"");
                if(sou == ''){
                    this.$Message.warning('请输入数据后再搜索...');
                }else if(sou == ' '){
                    this.$Message.warning('数据不能为空！');

                }else{
                    this.$router.push({name: 'Sou',query:{val:sou}});
                    // window.location.href=encodeURI("#/Sou?val="+sou);
                }

            }
        },
        mounted: function () {
            fetch('/api/wzzl').then(r=>r.json()).then(r=>{
                r.map((s)=>{
                    if(s.id == 1){
                        this.data9 =s
                    }
                })
            })
                let that = this;
                setInterval(function(){
                    that.dates = moment().format('ddd,A,LTS')
                },1000)
               let ass = location.href;
                let index = ass.lastIndexOf("#");
                 ass  = ass.substring(index + 2, ass.length);
                // console.log(ass)
            if(ass == ''){
                this.names= '/'
            }else {
                this.names= ass
            }



        }




    }
</script>

<style scoped>
    .bodi{
        width: 220px!important;
        min-width: 220px!important;
        min-height: 650px;
    }
    .hed{
        margin-top: 30px;
        background: #f8f8f9;
        display: flex;
        justify-content: center;
        align-items: center;
    }
    .hed_box{
        width: 250px;
        height: 45px;
        display: flex;
        justify-content: center;
        align-items: center;
        border-bottom: 2px solid #495060;
        box-sizing: border-box;
    }
    .hed_box h3{
        font-size: 18px;

    }
    .bq-box{
        background: #f8f8f9;
        width: 100%;
        display: flex;
        justify-content: flex-end;
        align-items: center;
    }
    .rili{
        width: 100%;
        height: auto;
        padding: 20px 0 20px;
        border-right: 1px solid #dddee1;
    }
    .kuanjia{
        width: 100%;
        height: 100%;
        padding: 20px 40px;
    }
    .shux{
        width: 100%;
        padding: 0 10px;
    }
    .shux h5{
        padding:8px 0 0 0;
        color: #4a4a4a;
        line-height: 20px;
    }
</style>