<template>
    <Htmb>
        <div style="padding: 20px 100px">
            <h2 style="padding: 20px 0 30px">新增作品</h2>
        <Form ref="formValidate" :model="formValidate" :rules="ruleValidate" :label-width="80">
            <FormItem label="作品名" prop="name">
                <Input v-model="formValidate.name" placeholder="请输入作品名..."></Input>
            </FormItem>
            <FormItem label="简介" prop="desc">
                <Input v-model="formValidate.desc" placeholder="请输入简介...（一句话）"></Input>
            </FormItem>
            <FormItem label="关键字" prop="gjz">
                <Input v-model="formValidate.gjz" placeholder="请输入关键字...（如：VUE）"></Input>
            </FormItem>
            <FormItem label="分类端" prop="clas">
                <Input v-model="formValidate.clas" placeholder="请输入作品分类端...（PC/移动）"></Input>
            </FormItem>
            <FormItem label="网址" prop="urls">
                <Input v-model="formValidate.urls" placeholder="请输入作品网址...（需加请求头）"></Input>
            </FormItem>
            <FormItem label="发布时间">
                <Row>
                    <Col span="11">
                    <FormItem prop="date">
                        <DatePicker type="date" placeholder="选择日期" v-model="formValidate.date"  @on-change="formValidate.date=$event"></DatePicker>
                    </FormItem>
                    </Col>
                    <!--<Col span="2" style="text-align: center">-</Col>-->
                    <Col span="11">
                    <FormItem prop="time">
                        <TimePicker type="time" placeholder="选择时间" v-model="formValidate.time" @on-change="formValidate.time=$event"></TimePicker>
                    </FormItem>
                    </Col>
                </Row>
            </FormItem>


            <FormItem label="图片" prop="imgs">
                <form @submit.prevent="submit" ref="form">
                    <div style="display: flex;align-items: center">
                        <div class="form-group">
                            <input type="file" name="f" class="form-control-file" id="exampleFormControlFile1">
                        </div>
                        <Input disabled v-model="formValidate.imgs" placeholder="提交前请先上传图片（务必）" style="width: 300px;margin-right: 20px"></Input>
                        <button type="submit" class="btn btn-primary" style="padding: 0px 20px;">上传</button>

                    </div>
                    <div class="imgs-box">
                        <img v-if="formValidate.imgs" :src="formValidate.imgs" alt="">
                    </div>
                </form>

            </FormItem>

            <FormItem style="padding-top: 10px;float: right">
                <Button type="primary" size="large" @click="handleSubmit('formValidate')">提交</Button>
                <Button type="ghost" size="large" @click="handleReset('formValidate')" style="margin-left: 8px;margin-left: 50px">重置</Button>
            </FormItem>
        </Form>
        </div>
    </Htmb>
</template>

<script>
    import Htmb from './htmb.vue'
    export default {
        name: "htzpxz",
        data () {
            return {
                formValidate: {
                    name: '',
                    desc: '',
                    gjz: '',
                    clas: '',
                    urls: '',
                    date: '',
                    time: '',
                    imgs: ''
                },
                ruleValidate: {
                    name: [
                        { required: true, message: '作品名不能为空！', trigger: 'blur' }
                    ],
                    desc: [
                        { required: true, message: '简介不能为空！', trigger: 'blur' },
                    ],
                    gjz: [
                        { required: true, message: '关键字不能为空！', trigger: 'blur' }
                    ],
                    clas: [
                        { required: true, message: '端分类不能为空！', trigger: 'blur' }
                    ],
                    urls: [
                        { required: true, message: '网址不能为空！', trigger: 'blur' }
                    ],
                    imgs: [
                        { required: true, message: '请上传图片！', trigger: 'blur' }
                    ],
                },
            }
        },
        methods: {
            handleSubmit (name) {
                this.$refs[name].validate((valid) => {
                    if (valid) {
                        fetch('/api/zpxz',{
                            method:'post',
                            credentials:'same-origin',
                            headers:{
                                'Content-Type':'application/json'
                            },
                            body:JSON.stringify(this.formValidate)
                        }).then(r=>r.json()).then(r=>{
                            if(r.state ===200){
                                this.$Message.success('提交成功!');
                                this.$router.push({name: 'Htzp'});
                            }else {
                                this.$Message.error('提交失败!')
                            }
                        })

                    } else {
                        this.$Message.error('提交失败！');
                    }

                })
            },
            handleReset (name) {
                this.$refs[name].resetFields();
            },
            submit:function (e) {
                console.log(e)
                fetch('/img/upload',{
                    credentials: "same-origin",
                    method: 'POST',
                    body:new FormData(this.$refs.form)
                }).then(r=>r.json()).then(data=>this.formValidate.imgs=data)

            }
        },
        components:{Htmb},

    }

</script>

<style>
    .imgs-box img{
        width: 300px;
        margin: 30px;
    }
    .ivu-alert{
        margin-bottom: 0;
        margin-left: 20px;
    }
</style>