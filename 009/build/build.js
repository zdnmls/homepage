'use strict'
require('./check-versions')()

process.env.NODE_ENV = 'production'

const ora = require('ora')
const rm = require('rimraf')
const path = require('path')
const chalk = require('chalk')
const webpack = require('webpack')
const config = require('../config')
const webpackConfig = require('./webpack.prod.conf')

const spinner = ora('项目编译中...')
spinner.start()

// rm(path.join(config.build.assetsRoot, config.build.assetsSubDirectory), err => {
//   if (err) throw err
    let sub = 1;
  webpack(webpackConfig, (err, stats) => {
    spinner.stop()
    if (err) throw err
    process.stdout.write(stats.toString({
      colors: true,
      modules: false,
      children: false, // If you are using ts-loader, setting this to true will make TypeScript errors show up during build.
      chunks: false,
      chunkModules: false
    }) + '\n\n')

    if (stats.hasErrors()) {
      console.log(chalk.red('  搭建失败！\n'))
      process.exit(1)
    }

    console.log(chalk.cyan('  搭建完成.\n'))
    // console.log(chalk.yellow(
    //   '  提示: 构建的文件应该在HTTP服务器上提供.\n' +
    //   '  Opening index.html over file:// won\'t work.\n'
    // ))
    console.log(chalk.yellow('编译成功：'+ '('+ sub++ +') 次！'))
  })
// })
