<template>
    <div class="layout">
        <Layout>
            <Header>
                <Menu mode="horizontal" theme="dark" active-name="1">
                    <div style="display: flex;justify-content: space-between;align-items: center">
                        <h3 style="color: #f5f5f5;">个人博客后台管理</h3>
                        <Button @click="end" type="error" shape="circle" icon="power" style="color: white"></Button>
                    </div>

                </Menu>
            </Header>
            <Layout>
                <Sider hide-trigger :style="{background: '#fff'}">
                    <Menu :active-name="page6" theme="light" width="auto" :open-names="['1','2','3','4']"  @on-select="ckkc">
                        <Submenu name="1">
                            <template slot="title">
                                <Icon type="android-home"></Icon>
                                我的主页
                            </template>
                            <MenuItem name="Htzy">欢迎您！</MenuItem>
                        </Submenu>
                        <Submenu name="2">
                            <template slot="title">
                                <Icon type="ios-flower"></Icon>
                                我的作品
                            </template>
                            <MenuItem name="Htzp">查看全部</MenuItem>
                            <MenuItem name="Htzpxz">新增作品</MenuItem>
                        </Submenu>
                        <Submenu name="3">
                            <template slot="title">
                                <Icon type="android-list"></Icon>
                                我的笔记
                            </template>
                            <MenuItem name="Htbj">查看全部</MenuItem>
                            <MenuItem name="Htbjxz">新增笔记</MenuItem>
                        </Submenu>
                        <Submenu name="4">
                            <template slot="title">
                                <Icon type="ios-home"></Icon>
                                其他管理
                            </template>
                            <MenuItem name="Htzl">个人信息</MenuItem>
                        </Submenu>
                    </Menu>
                </Sider>
                <Layout :style="{padding: '0 24px 24px'}">

                    <Content :style="{margin: '24px 0 0 0',padding: '24px', minHeight: 'calc(100vh - 116px)', background: '#fff'}">
                            <slot/>
                    </Content>
                </Layout>
            </Layout>
        </Layout>
    </div>
</template>

<script>
    export default {
        name: "htmb",
        data () {
            return {
                page6:(this.$route.path).slice(1)
            }
        },
        methods: {
            ckkc(name) {
                this.$router.push(name);
            },
            end(){
                this.$router.push({name:'Htdl'});
                this.$Message.success('退出成功！');
            }
        }


    }
</script>

<style>
    .layout{
        border: 1px solid #d7dde4;
        background: #f5f7f9;
        position: relative;
        border-radius: 4px;
        overflow: hidden;
    }
    .layout-logo{
        width: 100px;
        height: 30px;
        background: #5b6270;
        border-radius: 3px;
        float: left;
        position: relative;
        top: 15px;
        left: 20px;
    }
    .layout-nav{
        width: 420px;
        margin: 0 auto;
        margin-right: 20px;
    }
    .ivu-menu-submenu-title {
        background: #fff !important;
    }
</style>