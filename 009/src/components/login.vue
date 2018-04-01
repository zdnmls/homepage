<template>
    <div class="login-box">
        <Form ref="formInline" :model="formInline" :rules="ruleInline" >
            <FormItem prop="user">
                <Input type="text" v-model="formInline.user" placeholder="帐号/用户名">
                <Icon type="ios-person-outline" slot="prepend"></Icon>
                </Input>
            </FormItem>
            <FormItem prop="password">
                <Input type="password" v-model="formInline.password" placeholder="密码">
                <Icon type="ios-locked-outline" slot="prepend"></Icon>
                </Input>
            </FormItem>
            <FormItem>
                <Button type="primary" size="large" long @click="handleSubmit('formInline')">登 录</Button>
            </FormItem>
        </Form>
    </div>
</template>

<script>
    export default {
        name: "login",
        data () {
            return {
                formInline: {
                    user: '',
                    password: ''
                },
                ruleInline: {
                    user: [
                        { required: true, message: '请输入帐号/用户名', trigger: 'blur' }
                    ],
                    password: [
                        { required: true, message: '请输入密码', trigger: 'blur' },
                        { type: 'string', min: 6, message: '密码长度不能小于6', trigger: 'blur' }
                    ]
                },
                pageData:''
            }
        },
        methods: {
            handleSubmit(name) {
                this.$refs[name].validate((valid) => {
                    if (valid) {
                        fetch('/api/login',{
                            method:'post',
                            credentials:'same-origin',
                            headers:{
                                'Content-Type':'application/json'
                            },
                            body:JSON.stringify(this.formInline)
                        }).then(r=>r.json()).then(r=>{
                            if(r.state ===200){
                                this.$Message.success('登录成功!');
                                this.$router.push({name: 'Htzy'});
                            }else {
                                this.$Message.error('登录失败!')
                            }
                        })
                    } else {
                        this.$Message.error('登录失败!');
                        return false;
                    }
                })
            }
        }
    }
</script>

<style>
    body{
        width: 100%;
        height: 100%;
        background: #f8f8f9;
        background-size: 100%;
    }
    *{
        margin: 0;
        padding: 0;
    }
    .login-box{
        width: 500px;
        height: 260px;
        background: rgba(0,0,0,0.8);
        margin: 17% auto;
        padding: 60px;
        box-sizing: border-box;
        border-radius: 10px;
        box-shadow: 10px 10px 10px rgba(0,0,0,0.3);
    }
</style>