---
title: JavaScript模块化规范
date: 2019-12-17 10:00:00
---

# {{ $page.title }}

> [AMD , CMD, CommonJS，ES Module，UMD](https://juejin.im/post/5b7d2f45e51d4538826f4c28)

> [JavaScript模块化CommonJS/AMD/CMD/UMD/ES6Module的区别](https://www.cnblogs.com/weiqinl/p/9940549.html)

> [javascript模块化之CommonJS、AMD、CMD、UMD、ES6](http://www.kancloud.cn:8080/chandler/web_technology/387254)

> [关于AMD,CMD,CommonJS及UMD规范](http://blog.gejiawen.com/2015/11/03/what-is-amd-cmd-commonjs-umd/)

- 作用:

  **规范JavaScript的模块定义和加载机制，降低了学习和使用各种框架的门槛，能够以一种统一的方式去定义和使用模块，提高开发效率，降低了应用维护成本。**

- 模块化进程

  **原始的开发方式 -> CommonJS -> AMD -> CMD -> UMD -> ES6 Module**

## 原始的开发方式

JavaScript自身没有模块化机制。

``` js
// a.js
function a() {}

// b.js
function b() {}

// c.js
function c() {}
```

HTML加载:

``` html
<script src="a.js"></script>
<script src="b.js"></script>
<script src="c.js"></script>
```

## CommonJS

根据[CommonJS规范](http://javascript.ruanyifeng.com/nodejs/module.html)，**一个单独的文件就是一个模块**。每一个模块都是一个单独的作用域，也就是说，在一个文件定义的变量（还包括函数和类），都是私有的，对其他文件是不可见的。

一般应用于服务端(`Node.js`)，加载模块采用的是 **同步方式(只有加载完成才能执行后面的操作)**。同时，得力于[Browserify](https://github.com/substack/node-browserify)这样的第三方工具，我们可以在浏览器端使用采用CommonJS规范的`js`文件。

__CommonJS规范的3部分:__

- `require`: 模块引用

- `exports`: 模块导出

- `module`: 模块本身

``` js
// module_a.js
var $ = require('jquery')

function func(params) {
  // ....
}

module.exports = func
// or
// exports指向module.exports，即exports === module.exports
// exports = func
```

## AMD

[**Asynchronous Module Definition, 异步模块加载规范**](https://github.com/amdjs/amdjs-api/wiki/AMD-(中文版))。一般应用在浏览器端, 与浏览器的异步加载模块的环境相适应。

流行的浏览器端异步加载库[RequireJS](https://requirejs.org)实现的就是AMD规范, 在推广中逐渐完善。

__浏览器端`js`和服务器端`js`异同:__
| 服务器端JS | 浏览器端JS |
| --- | --- |
| 相同的代码需要多次执行 | 代码需要从一个服务器端分发到多个客户端执行 |
| CPU和内存资源是瓶颈 | 带宽是瓶颈 |
| 加载时从磁盘中加载 | 加载时需要通过网络加载 |

__AMD规范的3部分:__

- `define`: 定义模块

- `return`: 输出接口

- `require`: 加载模块

``` js
// module_a.js
define(['jquery', 'underscore'], function ($, _) {
  function method1() {};
  function method2() {};

  return {
    method1: method1,
    method2: method2
  }
});

// index.js
require(['module_a'], function(a) {
  a.method1();
  a.method2();
});
```

``` html
<!-- index.html -->
<script src="js/require.js" data-main="js/index"></script>
```

## CMD

[**Common Module Definition, 通用模块加载规范**](https://github.com/seajs/seajs/issues/242)。一般也是用在浏览器端。与`CommonJS`规范保持了很大的兼容性。

由国内**玉伯**大神在开发[SeaJS](https://seajs.github.io/seajs/docs/#docs)的时候提出来的

## UMD

Universal Module Definition, 通用模块规范
