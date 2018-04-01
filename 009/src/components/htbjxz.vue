<template>
    <Htmb>
        <div style="padding: 20px 100px">
            <h2 style="padding: 20px 0 30px">新增笔记</h2>
        <Form ref="formValidate" :model="formValidate" label-position="left" :rules="ruleValidate" :label-width="80" >
            <FormItem label="笔记名" prop="name">
                <Input v-model="formValidate.name" placeholder="请输入笔记名..."></Input>
            </FormItem>
            <FormItem label="关键字" prop="gjz">
                <Input v-model="formValidate.gjz" placeholder="请输入关键字...（如：VUE）"></Input>
            </FormItem>

            <FormItem label="内容" prop="desc">
                <div v-model="formValidate.desc" id="editorElem" style="text-align:left"></div>

                <!--<Input v-model="formValidate.desc" placeholder="请输入简介...（一句话）"></Input>-->
            </FormItem>

            <FormItem label="发布时间">
                <Row>
                    <Col span="11">
                    <FormItem prop="date">
                        <DatePicker type="date" placeholder="选择日期" v-model="formValidate.date" @on-change="formValidate.date=$event"></DatePicker>
                    </FormItem>
                    </Col>
                    <!--<Col span="2" style="text-align: center">-</Col>-->
                    <Col span="11">
                    <FormItem prop="time">
                        <TimePicker type="time" placeholder="选择时间" v-model="formValidate.time" @on-change="formValidate.date=$event"></TimePicker>
                    </FormItem>
                    </Col>
                </Row>
            </FormItem>
            <FormItem style="padding-top: 70px;float: right">
                <Button type="primary" size="large" @click="handleSubmit('formValidate')">提交</Button>
                <Button type="ghost" size="large" @click="handleReset('formValidate')" style="margin-left: 8px;margin-left: 50px">重置</Button>
            </FormItem>
        </Form>
        </div>
    </Htmb>
</template>

<script>
    import Htmb from './htmb.vue'
    import E from 'wangeditor'
    export default {
        name: "htzpxz",
        data () {
            return {
                editorContent: '',
                formValidate: {
                    name: '',
                    gjz: '',
                    date: '',
                    time: '',
                    desc: ''
                },
                ruleValidate: {
                    name: [
                        { required: true, message: '笔记名不能为空！', trigger: 'blur' }
                    ],
                    desc: [
                        { required: true, message: '内容不能为空！', trigger: 'blur' },
                    ],
                    gjz: [
                        { required: true, message: '关键字不能为空！', trigger: 'blur' }
                    ]
                }
            }
        },
        methods: {
            handleSubmit (name) {
                this.$refs[name].validate((valid) => {
                    if (valid) {
                        this.$Message.success('验证成功!');
                        fetch('/api/bjxz',{
                            method:'post',
                            credentials:'same-origin',
                            headers:{
                                'Content-Type':'application/json'
                            },
                            body:JSON.stringify(this.formValidate)
                        }).then(r=>r.json()).then(r=>{
                            if(r.state ===200){
                                this.$Message.success('提交成功!');
                                this.$router.push({name: 'Htbj'});
                            }else {
                                this.$Message.error('提交失败!')
                            }
                        })
                    } else {
                        this.$Message.error('验证失败!');
                    }
                })
            },
            handleReset (name) {
                this.$refs[name].resetFields();
            },
            getContent: function () {
                alert(this.editorContent)
            }
        },
        mounted() {
            var editor = new E('#editorElem')
            editor.customConfig.onchange = (html) => {
                this.formValidate.desc = html
            }
            editor.create()
        },
        components:{Htmb},

    }

</script>

<style>

</style>