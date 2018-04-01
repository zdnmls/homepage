import Vue from 'vue'
import Router from 'vue-router'
import ElementUI from 'element-ui';
import 'element-ui/lib/theme-chalk/index.css';
import iView from 'iview';
import 'iview/dist/styles/iview.css';
// 引用
var E = require('wangeditor')  // 使用 npm 安装
var E = require('wangeditor/release/wangEditor.min.js')  // 使用下载的源码

// 创建编辑器
// var editor = new E('#editor')
// editor.create()

import Htdl from '@/components/login.vue';
import Zhuye from '@/components/zhuye.vue';
// import Lists from '@/components/lists.vue';
import Demo from '@/components/demo.vue';
import Biji from '@/components/biji.vue';
import Nrxq from '@/components/nrxq.vue';
import Sou from '@/components/suibi.vue';
import Htzy from '@/components/htzy.vue';
import Htzp from '@/components/htzp.vue';
import Htbj from '@/components/htbj.vue';
import Htzpxz from '@/components/htzpxz.vue';
import Htbjxz from '@/components/htbjxz.vue';
import Htzl from '@/components/htzl.vue';


Vue.use(Router);
Vue.use(iView);
Vue.use(ElementUI);


export default new Router({
  routes: [
      {
          path: '/',
          name: 'Zhuye',
          component: Zhuye
      },
    //   {
    //       path: '/lists',
    //       name: 'Lists',
    //       component: Lists
    //   },
      {
          path: '/demo',
          name: 'Demo',
          component: Demo
      },
      {
          path: '/biji',
          name: 'Biji',
          component: Biji
      },
      {
          path: '/sou',
          name: 'Sou',
          component: Sou
      },
      {
          path: '/nrxq',
          name: 'Nrxq',
          component: Nrxq
      },
      {
          path: '/htdl',
          name: 'Htdl',
          component: Htdl
      },
      {
          path: '/htzy',
          name: 'Htzy',
          component: Htzy
      },
      {
          path: '/htzp',
          name: 'Htzp',
          component: Htzp
      },
      {
          path: '/htbj',
          name: 'Htbj',
          component: Htbj
      },
      {
          path: '/htzpxz',
          name: 'Htzpxz',
          component: Htzpxz
      },
      {
          path: '/htbjxz',
          name: 'Htbjxz',
          component: Htbjxz
      },
      {
          path: '/htzl',
          name: 'Htzl',
          component: Htzl
      },

  ]
})
