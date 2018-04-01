-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: 2018-03-30 08:43:52
-- 服务器版本： 5.7.19
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `xczdeku`
--

-- --------------------------------------------------------

--
-- 表的结构 `demos`
--

DROP TABLE IF EXISTS `demos`;
CREATE TABLE IF NOT EXISTS `demos` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `content` varchar(255) NOT NULL DEFAULT '',
  `card` varchar(255) NOT NULL DEFAULT '',
  `imgs` varchar(255) NOT NULL DEFAULT '',
  `pages` int(10) NOT NULL DEFAULT '0',
  `class` varchar(100) NOT NULL,
  `url` varchar(100) NOT NULL,
  `times` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `demos`
--

INSERT INTO `demos` (`id`, `name`, `content`, `card`, `imgs`, `pages`, `class`, `url`, `times`) VALUES
(1, '甜点咖啡网站', '关于展示甜品官网的企业网站', '响应式', '/img/login.png', 9, 'PC端', 'http://coffeexcz.duapp.com/', '2018-03-13 16:53:49'),
(2, '职业高中学校网站', '关于学校的官方网站', '企业站', '/img/login.jpeg', 8, 'PC端', 'http://localhost/qiye2/company/index.php', '2018-03-26 16:53:49'),
(3, '花卉志APP', '一个可以查看花卉买家的移动端APP', 'APP', '/img/logind.jpg', 5, '移动端', 'http://mlsflower.duapp.com/flower/index.php', '2018-02-21 17:52:51'),
(4, 'PHP后台管理', '一个PHP的网站后台管理项目', 'PHP', '/img/1522346055019.jpg', 2, 'PC端', 'http://localhost:9600/page-pass2.php', '2017-10-24 12:03:00'),
(5, '置方地产企业网站', '一个房地产行业的企业站', 'PHP', '/img/1522372859798.jpg', 4, 'PC端', 'http://zhifang.duapp.com/php/qiye/index.php', '2018-03-13 04:00:00'),
(6, 'mooc慕课网站模拟PC端', '模仿慕课网设计', 'VUE', '/img/1522373089730.jpg', 3, 'PC端', 'http://localhost:888/#/', '2016-01-06 07:00:00'),
(7, 'mooc慕课APP的模拟', 'mooc慕课网的APP端', 'VUE', '/img/mka.jpg', 5, 'PC端', 'http://localhost:886/#/', '2016-02-10 02:00:00'),
(8, '学生管理系统', '主要是ECharts的运用，数据可视化', 'Echarts', '/img/1522373362061.jpg', 3, 'PC端', 'http://localhost:280/', '2018-03-30 05:00:00');

-- --------------------------------------------------------

--
-- 表的结构 `grzl`
--

DROP TABLE IF EXISTS `grzl`;
CREATE TABLE IF NOT EXISTS `grzl` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `webs` varchar(255) NOT NULL DEFAULT '',
  `zym` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `jie` varchar(255) NOT NULL DEFAULT '',
  `fot` varchar(255) NOT NULL DEFAULT '',
  `imgs` varchar(255) NOT NULL DEFAULT '',
  `times` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `grzl`
--

INSERT INTO `grzl` (`id`, `webs`, `zym`, `name`, `jie`, `fot`, `imgs`, `times`) VALUES
(1, '许超智的个人主页', '天下大事，必作于易，天下难事，必作于细.', '许超智', '毕业于山西工商学院，计算机系', '路漫漫其修远兮，吾将上下而求索', '/img/1522396712215.JPG', '1993-10-20 04:00:06');

-- --------------------------------------------------------

--
-- 表的结构 `notes`
--

DROP TABLE IF EXISTS `notes`;
CREATE TABLE IF NOT EXISTS `notes` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `content` mediumtext NOT NULL,
  `card` varchar(255) NOT NULL DEFAULT '',
  `imgs` varchar(255) NOT NULL DEFAULT '/imgs/login.jpg',
  `pages` int(10) NOT NULL DEFAULT '0',
  `times` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `notes`
--

INSERT INTO `notes` (`id`, `name`, `content`, `card`, `imgs`, `pages`, `times`) VALUES
(1, 'VUE的开发流程1', '1.$ node -v (检测node版本，node版本需要在 V4 以上)\r\n\r\n2.全局安装vue $ npm install -g vue\r\n\r\n3.安装脚手架 $ npm install -g vue-cli\r\n\r\n4.运行 vue 命令，看是否已安装完毕 $ vue / $ vue list (查看可安装的模板)\r\n\r\n5.安装模板 $ vue init webpack(模板) sell(项目名称)\r\n\r\n6.? Project name sell\r\n\r\n　? Project description sell app\r\n\r\n　? Author crazyCode <1178770858@qq.com>\r\n\r\n　? Use ESLint to lint your code? Yes\r\n\r\n　? Pick an ESLint preset Standard\r\n\r\n　? Setup unit tests with Karma + Mocha? No\r\n\r\n　? Setup e2e tests with Nightwatch? No\r\n\r\n7.$ cd sell (进入项目目录)\r\n\r\n8.$ ll -a (查看目录结构)\r\n\r\n9.$ npm install (安装模块下代码的依赖)\r\n\r\n10.$ npm run dev (运行项目)\r\n\r\n11.项目准备 A.新建resource文件夹，将图片文件放在 resource 之中\r\n\r\n　　　　　　B.通过IcoMoon 将svg 图片制作成矢量图标\r\n\r\n12. 设计项目目录A.所以的代码文件都放在 src 文件夹中 ，src 下 一般有三个子目录 assets 、components(在其中自建文件夹，存放组件，满足组件就近维护的原则) 和common(公共的模块和资源，其中有3个子目录,js,stylus,fonts)\r\n\r\nB.图片资源文件放在 resource 文件夹之中\r\n\r\n13.复制之前的矢量图标文件(4个)及 style.css，存放在fonts文件目录和 stylus文件目录下，将style.css 改名为 icon.styl 且内容格式同步（只需删除文件中{}和 ； 即可）\r\n\r\n14.删除assets 和 router 目录', 'VUE', '/imgs/login.jpg', 103, '2018-03-06 22:54:26'),
(2, 'node的开发流程', '1.$ node -v (检测node版本，node版本需要在 V4 以上)\r\n\r\n2.全局安装vue $ npm install -g vue\r\n\r\n3.安装脚手架 $ npm install -g vue-cli\r\n\r\n4.运行 vue 命令，看是否已安装完毕 $ vue / $ vue list (查看可安装的模板)\r\n\r\n5.安装模板 $ vue init webpack(模板) sell(项目名称)\r\n\r\n6.? Project name sell\r\n\r\n　? Project description sell app\r\n\r\n　? Author crazyCode <1178770858@qq.com>\r\n\r\n　? Use ESLint to lint your code? Yes\r\n\r\n　? Pick an ESLint preset Standard\r\n\r\n　? Setup unit tests with Karma + Mocha? No\r\n\r\n　? Setup e2e tests with Nightwatch? No\r\n\r\n7.$ cd sell (进入项目目录)\r\n\r\n8.$ ll -a (查看目录结构)\r\n\r\n9.$ npm install (安装模块下代码的依赖)\r\n\r\n10.$ npm run dev (运行项目)\r\n\r\n11.项目准备 A.新建resource文件夹，将图片文件放在 resource 之中\r\n\r\n　　　　　　B.通过IcoMoon 将svg 图片制作成矢量图标\r\n\r\n12. 设计项目目录A.所以的代码文件都放在 src 文件夹中 ，src 下 一般有三个子目录 assets 、components(在其中自建文件夹，存放组件，满足组件就近维护的原则) 和common(公共的模块和资源，其中有3个子目录,js,stylus,fonts)\r\n\r\nB.图片资源文件放在 resource 文件夹之中\r\n\r\n13.复制之前的矢量图标文件(4个)及 style.css，存放在fonts文件目录和 stylus文件目录下，将style.css 改名为 icon.styl 且内容格式同步（只需删除文件中{}和 ； 即可）\r\n\r\n14.删除assets 和 router 目录', 'node', '/imgs/login.jpg', 49, '2017-03-26 22:54:26'),
(4, 'VUE的开发流程2', '1.$ node -v (检测node版本，node版本需要在 V4 以上)\r\n\r\n2.全局安装vue $ npm install -g vue\r\n\r\n3.安装脚手架 $ npm install -g vue-cli\r\n\r\n4.运行 vue 命令，看是否已安装完毕 $ vue / $ vue list (查看可安装的模板)\r\n\r\n5.安装模板 $ vue init webpack(模板) sell(项目名称)\r\n\r\n6.? Project name sell\r\n\r\n　? Project description sell app\r\n\r\n　? Author crazyCode <1178770858@qq.com>\r\n\r\n　? Use ESLint to lint your code? Yes\r\n\r\n　? Pick an ESLint preset Standard\r\n\r\n　? Setup unit tests with Karma + Mocha? No\r\n\r\n　? Setup e2e tests with Nightwatch? No\r\n\r\n7.$ cd sell (进入项目目录)\r\n\r\n8.$ ll -a (查看目录结构)\r\n\r\n9.$ npm install (安装模块下代码的依赖)\r\n\r\n10.$ npm run dev (运行项目)\r\n\r\n11.项目准备 A.新建resource文件夹，将图片文件放在 resource 之中\r\n\r\n　　　　　　B.通过IcoMoon 将svg 图片制作成矢量图标\r\n\r\n12. 设计项目目录A.所以的代码文件都放在 src 文件夹中 ，src 下 一般有三个子目录 assets 、components(在其中自建文件夹，存放组件，满足组件就近维护的原则) 和common(公共的模块和资源，其中有3个子目录,js,stylus,fonts)\r\n\r\nB.图片资源文件放在 resource 文件夹之中\r\n\r\n13.复制之前的矢量图标文件(4个)及 style.css，存放在fonts文件目录和 stylus文件目录下，将style.css 改名为 icon.styl 且内容格式同步（只需删除文件中{}和 ； 即可）\r\n\r\n14.删除assets 和 router 目录', 'VUE', '/imgs/login.jpg', 98, '2018-02-01 22:54:26'),
(9, 'HTML基础', '<h3 cid=\"n0\" mdtype=\"heading\"><span md-inline=\"plain\">flex布局：</span></h3><p cid=\"n2\" mdtype=\"paragraph\"><span cid=\"n3\" mdtype=\"line\"><span md-inline=\"plain\" box-sizing:=\"\" border-box;\"=\"\">（父元素）   容器：display：flex；</span></span></p><p cid=\"n4\" mdtype=\"paragraph\"><span cid=\"n5\" mdtype=\"line\"><span md-inline=\"plain\">（子元素）   项目：float  clear vertical-align这些都会失效；</span></span></p><p cid=\"n6\" mdtype=\"paragraph\"><span cid=\"n7\" mdtype=\"line\"><span md-inline=\"plain\">	水平方向的我们把它叫做主轴（主轴的方向可以改变）</span></span></p><p cid=\"n8\" mdtype=\"paragraph\"><span cid=\"n9\" mdtype=\"line\"><span md-inline=\"plain\">	垂直方向的我们把它叫做交叉轴</span></span></p><p cid=\"n10\" mdtype=\"paragraph\"><span cid=\"n11\" mdtype=\"line\"></span></p><h3 cid=\"n12\" mdtype=\"heading\"><span md-inline=\"plain\">容器的属性</span></h3><p></p><pre lang=\"css\" contenteditable=\"false\" cid=\"n13\" mdtype=\"fences\"><span></span><br><span role=\"presentation\"><span>1.</span>决定主轴的方向：</span><br><span role=\"presentation\"><span role=\"presentation\" cm-text=\"	\">    </span><span>flex-direction</span>:<span>row</span>; &nbsp; &nbsp; &nbsp; 决定主轴在水平方向，项目从左向右排列 &nbsp; 【默认值】</span><br><span role=\"presentation\"><span role=\"presentation\" cm-text=\"	\">    </span><span>flex-direction</span>:<span>row-reverse</span>; &nbsp; &nbsp; &nbsp; 决定主轴在水平方向，项目从右向左排列</span><br><span role=\"presentation\"><span role=\"presentation\" cm-text=\"	\">    </span><span>flex-direction</span>:<span>column</span>; &nbsp; &nbsp; &nbsp; 决定主轴在垂直方向，项目从上到下排布</span><br><span role=\"presentation\"><span role=\"presentation\" cm-text=\"	\">    </span><span>flex-direction</span>:<span>column-reverse</span>; &nbsp; &nbsp; &nbsp; 决定主轴在垂直方向，项目从下到上排布</span><br><span role=\"presentation\"><span>2.</span>用来指定项目的换行：</span><br><span role=\"presentation\"><span role=\"presentation\" cm-text=\"	\">    </span><span>flex-wrap</span>:<span>wrap</span>; &nbsp; &nbsp; 换行，项目从上到下排布</span><br><span role=\"presentation\"><span role=\"presentation\" cm-text=\"	\">    </span><span>flex-wrap</span>:<span>wrap-reverse</span>; &nbsp; &nbsp; 换行，项目从下到上排布<span role=\"presentation\" cm-text=\"	\"> </span></span><br><span role=\"presentation\"> <span role=\"presentation\" cm-text=\"	\">   </span><span>flex-wrap</span>:<span>nowrap</span>; &nbsp; &nbsp; 不换行 【默认值】</span><br><span role=\"presentation\"><span>3.</span>项目在主轴上的对齐方式</span><br><span role=\"presentation\"><span role=\"presentation\" cm-text=\"	\">    </span><span>justify-content</span>:<span>flex-start</span>; 主轴起点对齐</span><br><span role=\"presentation\"><span role=\"presentation\" cm-text=\"	\">    </span><span>justify-content</span>:<span>flex-end</span>; 主轴终点对齐</span><br><span role=\"presentation\"><span role=\"presentation\" cm-text=\"	\">    </span><span>justify-content</span>:<span>center</span>；主轴中点对齐</span><br><span role=\"presentation\"><span role=\"presentation\" cm-text=\"	\">    </span><span>justify-content</span>:<span>space-between</span>；两端对齐，剩余空间平均分布（顶到边）</span><br><span role=\"presentation\"><span role=\"presentation\" cm-text=\"	\">    </span><span>justify-content</span>:<span>space-around</span>：项目两侧间距一样</span><br><span role=\"presentation\"><span>4.</span>项目在交叉轴的对齐方式</span><br><span role=\"presentation\"><span role=\"presentation\" cm-text=\"	\">    </span><span>align-items</span>:<span>flex-start</span>;交叉轴起点对齐</span><br><span role=\"presentation\"><span role=\"presentation\" cm-text=\"	\">    </span><span>align-items</span>:<span>flex-end</span>;交叉轴终点对齐</span><br><span role=\"presentation\"><span role=\"presentation\" cm-text=\"	\">    </span><span>align-items</span>:<span>center</span>；交叉轴中点对齐</span><br><span role=\"presentation\"><span role=\"presentation\" cm-text=\"	\">    </span><span>align-items</span>:<span>baseline</span>：基于基线对齐  （指文本的底部）</span><br><span role=\"presentation\"><span>5.</span>项目在交叉轴方向对齐方式【多根轴线，一根轴线失效】</span><br><span role=\"presentation\"><span role=\"presentation\" cm-text=\"	\">    </span><span>align-content</span>:<span>flex-start</span>;交叉轴起点对齐</span><br><span role=\"presentation\"><span role=\"presentation\" cm-text=\"	\">    </span><span>align-content</span>:<span>flex-end</span>;交叉轴终点对齐</span><br><span role=\"presentation\"><span role=\"presentation\" cm-text=\"	\">    </span><span>align-content</span>:<span>center</span>：交叉轴中点对齐</span><br><span role=\"presentation\"><span role=\"presentation\" cm-text=\"	\">    </span><span>align-content</span>:<span>space-between</span>；两端对齐</span><br><span role=\"presentation\"><span role=\"presentation\" cm-text=\"	\">    </span><span>align-content</span>:<span>space-around</span>：每个项目两侧间距一样</span></pre><p cid=\"n14\" mdtype=\"paragraph\"><span cid=\"n15\" mdtype=\"line\" contenteditable=\"true\"><span md-inline=\"plain\">项目的属性：</span></span></p><p></p><pre lang=\"css\" contenteditable=\"false\" cid=\"n16\" mdtype=\"fences\"><span></span><br><span role=\"presentation\"><span>1.</span> <span>order</span> &nbsp; 定义项目的排列顺序，数值越小越靠前，默认值为<span>0</span>，可以识别负数。</span><br><span role=\"presentation\"><span>2.</span> <span>flex-grow</span>  定义项目的放大比例，默认值为<span>0</span>，即使有剩余空间也不放大，</span><br><span role=\"presentation\"><span role=\"presentation\" cm-text=\"	\">    </span><span role=\"presentation\" cm-text=\"	\">    </span><span role=\"presentation\" cm-text=\"	\">    </span>所有项目<span>flex-grow</span>值为<span>1</span>，将等分剩余空间</span><br><span role=\"presentation\"><span role=\"presentation\" cm-text=\"	\">    </span><span role=\"presentation\" cm-text=\"	\">    </span><span role=\"presentation\" cm-text=\"	\">    </span>其中的一个项目<span>flex-grow</span>值为<span>2</span>，其余项目的<span>flex-grow</span>值为<span>1</span>，则它占据的剩余空间比其他多一倍。</span><br><span role=\"presentation\"><span>3.</span> <span>flex-shrink</span>  属性定义了项目的缩小比例，默认为<span>1</span>，即如果空间不足，该项目将缩小。</span><br><span role=\"presentation\"><span role=\"presentation\" cm-text=\"	\">    </span><span role=\"presentation\" cm-text=\"	\">    </span>如果所有项目的<span>flex-shrink</span>属性都为<span>1</span>，当空间不足时，都将等比例缩小。如果一个项目的<span>flex-shrink</span><span role=\"presentation\" cm-text=\"	\">   </span><span role=\"presentation\" cm-text=\"	\">    </span><span role=\"presentation\" cm-text=\"	\">    </span>属性为<span>0</span>，其他项目都为<span>1</span>，则空间不足时，前者不缩小。</span><br><span role=\"presentation\"><span role=\"presentation\" cm-text=\"	\">    </span><span role=\"presentation\" cm-text=\"	\">    </span>负值对该属性无效。</span><br><span role=\"presentation\"><span>4.</span> <span>flex-basis</span> 定义在分配多余空间之前，项目占据的主轴空间</span><br><span role=\"presentation\"><span>5.</span> <span>align-self</span>定义单个项目在交叉轴上的对齐方式</span><br><span role=\"presentation\"><span role=\"presentation\" cm-text=\"	\">    </span><span>flex-start</span></span><br><span role=\"presentation\"><span role=\"presentation\" cm-text=\"	\">    </span><span>flex-end</span> </span><br><span role=\"presentation\"><span role=\"presentation\" cm-text=\"	\">    </span><span>center</span> </span><br><span role=\"presentation\"><span role=\"presentation\" cm-text=\"	\">    </span><span>baseline</span> </span><br><span role=\"presentation\"><span role=\"presentation\" cm-text=\"	\">    </span><span>stretch</span></span><br><span role=\"presentation\"><span cm-text=\"\"></span></span></pre><p cid=\"n17\" mdtype=\"paragraph\"><span cid=\"n18\" mdtype=\"line\" contenteditable=\"true\"><span md-inline=\"plain\">作业：</span></span></p><p cid=\"n19\" mdtype=\"paragraph\"><span cid=\"n20\" mdtype=\"line\" contenteditable=\"true\"><span md-inline=\"plain\">flex布局做完。</span></span></p><p cid=\"n21\" mdtype=\"paragraph\"><span cid=\"n22\" mdtype=\"line\" contenteditable=\"true\"><span md-inline=\"plain\">需求分析</span></span></p><p cid=\"n23\" mdtype=\"paragraph\"><span cid=\"n24\" mdtype=\"line\" contenteditable=\"true\"><span md-inline=\"plain\">布局app 头部 </span></span></p>', 'HTML', '/imgs/login.jpg', 36, '2017-08-08 05:00:00'),
(10, 'HTML定位', '<p cid=\"n0\" mdtype=\"paragraph\">一、定位：<br></p><p cid=\"n12\" mdtype=\"paragraph\"><span cid=\"n13\" mdtype=\"line\"><span md-inline=\"plain\">可以把元素放到页面的任意位置；</span></span></p><h5 cid=\"n14\" mdtype=\"heading\"><span md-inline=\"plain\">1、相对定位<span style=\"text-decoration-line: line-through;\"></span></span></h5><p></p><pre lang=\"css\" contenteditable=\"false\" cid=\"n15\" mdtype=\"fences\"><span></span><br><span role=\"presentation\"><span>position</span>:<span>relative</span>;</span><br><span role=\"presentation\"><span>top</span> &nbsp; &nbsp; &nbsp;<span>bottom</span> &nbsp; &nbsp; <span>left</span> &nbsp; &nbsp; <span>right</span></span><br><span role=\"presentation\">相对于自己原来的位置进行定位</span></pre><h5 cid=\"n16\" mdtype=\"heading\" contenteditable=\"true\"><span md-inline=\"plain\">2、绝对定位  (父子关系)</span></h5><p></p><pre lang=\"css\" contenteditable=\"false\" cid=\"n17\" mdtype=\"fences\"><span></span><br><span role=\"presentation\">(<span>1</span>)找父元素 &nbsp; <span>position</span>：<span>relative</span>;</span><br><span role=\"presentation\">(<span>2</span>)找子元素<span role=\"presentation\" cm-text=\"	\"> </span> &nbsp;<span>position</span>：<span>absolute</span>;</span><br><span role=\"presentation\">(<span>3</span>)调整位置<span role=\"presentation\" cm-text=\"	\"> </span> &nbsp;<span>top</span><span role=\"presentation\" cm-text=\"	\">   </span><span>bottom</span><span role=\"presentation\" cm-text=\"	\">  </span><span>left</span><span role=\"presentation\" cm-text=\"	\">    </span><span>right</span><span role=\"presentation\" cm-text=\"	\">   </span></span><br><span role=\"presentation\">注意：</span><br><span role=\"presentation\"><span>1.</span>父元素只要有定位属性就可以</span><br><span role=\"presentation\"><span>2.</span>如果父元素没有定位属性，会相对于整个窗口定位</span></pre><h5 cid=\"n18\" mdtype=\"heading\" contenteditable=\"true\"><span md-inline=\"plain\">3、固定定位</span></h5><p></p><pre lang=\"css\" contenteditable=\"false\" cid=\"n19\" mdtype=\"fences\"><span></span><br><span role=\"presentation\"><span>position</span>：<span>fixed</span>；</span><br><span role=\"presentation\">调整位置<span role=\"presentation\" cm-text=\"	\">    </span> &nbsp;<span>top</span><span role=\"presentation\" cm-text=\"	\">   </span><span>bottom</span><span role=\"presentation\" cm-text=\"	\">  </span><span>left</span><span role=\"presentation\" cm-text=\"	\">    </span><span>right</span><span role=\"presentation\" cm-text=\"	\">   </span></span><br><span role=\"presentation\">调整层级 &nbsp; &nbsp;<span>z-index</span>：<span>999</span>；（只有定位属性，才使用）</span></pre><p cid=\"n20\" mdtype=\"paragraph\"><span cid=\"n21\" mdtype=\"line\" contenteditable=\"true\"><span md-inline=\"plain\">二、盒子模型中的问题</span></span></p><p cid=\"n22\" mdtype=\"paragraph\"><span cid=\"n23\" mdtype=\"line\" contenteditable=\"true\"><span md-inline=\"plain\">	1.去掉浏览器的默认样式</span></span></p><p cid=\"n24\" mdtype=\"paragraph\"><span cid=\"n25\" mdtype=\"line\" contenteditable=\"true\"><span md-inline=\"plain\">	2.margin-top;的bug；</span></span></p><p cid=\"n26\" mdtype=\"paragraph\"><span cid=\"n27\" mdtype=\"line\" contenteditable=\"true\"><span md-inline=\"plain\">	3.margin可以设置负值，padding没有负值</span></span></p><p cid=\"n28\" mdtype=\"paragraph\"><span cid=\"n29\" mdtype=\"line\" contenteditable=\"true\"><span md-inline=\"plain\">	4、盒子模型在页面中显示的真实宽高</span></span></p><p></p><pre lang=\"css\" contenteditable=\"false\" cid=\"n30\" mdtype=\"fences\"><span></span><br><span role=\"presentation\">宽:<span>width</span> + <span>padding-left</span> + <span>padding-right</span> + <span>border-left</span> + <span>border-right</span></span><br><span role=\"presentation\">高:<span>hight</span> + <span>padding-top</span> + <span>padding-bottom</span> + <span>border-top</span> + <span>border-bottom</span></span></pre><p cid=\"n31\" mdtype=\"paragraph\"><span cid=\"n32\" mdtype=\"line\" contenteditable=\"true\"><span md-inline=\"plain\">	5、行内标签 a</span></span></p><p cid=\"n33\" mdtype=\"paragraph\"><span cid=\"n34\" mdtype=\"line\" contenteditable=\"true\"><span md-inline=\"plain\">		只能设置左右间距，不能设置上下间距     (需要设置的话，加浮动)</span></span></p><h5 cid=\"n35\" mdtype=\"heading\" contenteditable=\"true\"><span md-inline=\"plain\">搜索框，默认蓝边框去掉</span></h5><p></p><pre lang=\"css\" contenteditable=\"false\" cid=\"n36\" mdtype=\"fences\"><span></span><br><span role=\"presentation\">获取焦点</span><br><span role=\"presentation\"><span>input</span>:<span>focus</span>{</span><br><span role=\"presentation\"><span role=\"presentation\" cm-text=\"	\">    </span><span>outline</span>: <span>none</span>;（或者<span>outline</span>：<span>1px</span> <span>solid</span> <span>red</span>）</span><br><span role=\"presentation\">}</span></pre><p cid=\"n37\" mdtype=\"paragraph\"><span cid=\"n38\" mdtype=\"line\" contenteditable=\"true\"><span md-inline=\"plain\">	7、改变透明度：</span></span></p><p cid=\"n39\" mdtype=\"paragraph\"><span cid=\"n40\" mdtype=\"line\" contenteditable=\"true\"><span md-inline=\"plain\">		opacity:0.5;  （0-1之间的小数；0表示透明，1表示不透明）</span></span></p><p cid=\"n41\" mdtype=\"paragraph\"><span cid=\"n42\" mdtype=\"line\" contenteditable=\"true\"><span md-inline=\"plain\">		transparent：代表透明色  相当于一种色彩。</span></span></p><p cid=\"n43\" mdtype=\"paragraph\"><span cid=\"n44\" mdtype=\"line\" contenteditable=\"true\"><span md-inline=\"plain\">	8.2.5D</span></span></p><p></p><pre lang=\"css\" contenteditable=\"false\" cid=\"n45\" mdtype=\"fences\"><span role=\"presentation\"><span>1</span>、旋转</span><br><span role=\"presentation\"><span>.box</span>｛</span><br><span role=\"presentation\"><span role=\"presentation\" cm-text=\"	\">    </span><span>width</span>:<span>300px</span>;</span><br><span role=\"presentation\"><span role=\"presentation\" cm-text=\"	\">    </span><span>hight</span>:<span>300px</span>;</span><br><span role=\"presentation\"><span role=\"presentation\" cm-text=\"	\">    </span><span>background</span>:<span>red</span>;</span><br><span role=\"presentation\"><span role=\"presentation\" cm-text=\"	\">    </span>过渡时间</span><br><span role=\"presentation\"><span role=\"presentation\" cm-text=\"	\">    </span><span>transition</span>: <span>all</span> <span>2s</span>；</span><br><span role=\"presentation\">｝</span><br><span role=\"presentation\"><span>.box</span>:<span>hover</span>{</span><br><span role=\"presentation\"> &nbsp; &nbsp;<span>transform</span>:<span>rotate</span>(度数)</span><br><span role=\"presentation\">}</span><br><span role=\"presentation\"><span>2</span>、缩放</span><br><span role=\"presentation\"> &nbsp;  水平方向缩放：（倍数）</span><br><span role=\"presentation\"> &nbsp; &nbsp;<span>transform</span>：<span>scaleX</span>(<span>0</span>);</span><br><span role=\"presentation\"> &nbsp;  垂直方向缩放：（倍数）</span><br><span role=\"presentation\"> &nbsp; &nbsp;<span>transform</span>：<span>scaleY</span>(<span>0</span>);</span><br><span role=\"presentation\"> &nbsp; &nbsp;<span>transform</span>：<span>translate</span>(<span>30px</span>,<span>30px</span>);</span><br><span role=\"presentation\"> &nbsp; &nbsp;<span>transform</span>：<span>scale</span>(<span>2</span>,<span>2</span>);</span><br><span role=\"presentation\"><span>3</span>、斜切（平行四边形样式）</span><br><span role=\"presentation\"> &nbsp;  水平方向斜切：<span role=\"presentation\" cm-text=\"	\"> </span></span><br><span role=\"presentation\"> &nbsp; &nbsp;<span>transform</span>：<span>skewX</span>(<span>45deg</span>);</span><br><span role=\"presentation\"> &nbsp;  垂直方向斜切：</span><br><span role=\"presentation\"> &nbsp; &nbsp;<span>transform</span>：<span>skewY</span>(<span>45deg</span>);</span><br><span role=\"presentation\"> &nbsp;  简写</span><br><span role=\"presentation\"> &nbsp; &nbsp;<span>transform</span>：<span>skew</span>(<span>45deg</span>,<span>45deg</span>);</span></pre><p><p cid=\"n48\" mdtype=\"paragraph\"><span cid=\"n49\" mdtype=\"line\" contenteditable=\"true\"></span></p><p cid=\"n50\" mdtype=\"paragraph\"><span cid=\"n51\" mdtype=\"line\" contenteditable=\"true\"></span></p><p cid=\"n52\" mdtype=\"paragraph\"><span cid=\"n53\" mdtype=\"line\" contenteditable=\"true\"></span></p><p cid=\"n54\" mdtype=\"paragraph\"><span cid=\"n55\" mdtype=\"line\" contenteditable=\"true\"></span></p><p cid=\"n56\" mdtype=\"paragraph\"><br></p></p><p cid=\"n46\" mdtype=\"paragraph\"><span cid=\"n47\" mdtype=\"line\" contenteditable=\"true\"></span></p>', 'HTML', '/imgs/login.jpg', 3, '2018-03-06 04:00:00');

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `zhanghao` varchar(100) NOT NULL,
  `pass` varchar(100) NOT NULL DEFAULT '123456',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`zhanghao`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`id`, `zhanghao`, `pass`) VALUES
(1, 'xczxcz', '123123');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
