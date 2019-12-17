---
title: 依赖管理
date: 2019-12-17 14:00:00
---

# {{ $page.title }}

## 部分依赖

- `axios`: `http`请求库, 可以用在浏览器和 node.js 中

- `vue`: 核心库, 只关注视图层

- `vue-loader`: 一个`webpack`的`loader`，它允许你以一种名为[单文件组件(SFCs)](https://vue-loader.vuejs.org/zh/spec.html)的格式撰写`Vue`组件

- `vue-router`: 路由管理器

- `vuex`: 一个专为`Vue.js`应用程序开发的 **状态管理模式**

- `element-ui`: UI框架([2019最受欢迎的前端7个UI框架](https://zhuanlan.zhihu.com/p/61403630))

- `babel*`: `js`编译器, 主要用于将ES6+的代码转为向后兼容的`js`语法(**语法转换**)

- `css-loader`: [CSS 相关](https://cli.vuejs.org/zh/guide/css.html)
  - [浅谈css预处理器，Sass、Less和Stylus](https://zhuanlan.zhihu.com/p/23382462)
  - [浅谈 CSS 预处理器（一）：为什么要使用预处理器？](https://github.com/cssmagic/blog/issues/73)

- `eslint`: 属于一种QA工具，是一个ECMAScript/JavaScript语法规则和代码风格的检查工具，可以用来保证写出语法正确、风格统一的代码

- `webpack*`: 用于开发及打包

## 依赖管理工具

> [npm和yarn的区别，我们该如何选择？](https://zhuanlan.zhihu.com/p/27449990)

> [从npm迁移](https://yarnpkg.com/zh-Hans/docs/migrating-from-npm)

- `npm`

- `yarn`
  ``` sh
  $ npm install -g yarn
  $ npm list -g --depth=0
  ```
- `pnpm`

### 关于`npx`

> [npx 使用教程](https://www.ruanyifeng.com/blog/2019/02/npx.html)

> [npx和npm之间的关系](https://juejin.im/post/5d8343ca6fb9a06aea61cbcd)

`npx`是一个工具，它是`npm v5.2.0`引入的一条命令（`npx`），是`npm`的一个包执行器，只要为了提高从`npm`注册表使用软件包的体验 。

## [vue-cli](https://cli.vuejs.org/zh/)

**不推荐新手直接使用`vue-cli`，尤其是在你还不熟悉基于`Node.js`的构建工具时。**
