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

// index.js
var ma = require('module_a')
console.log(ma.func({}))
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

由国内**玉伯**大神在开发[SeaJS](https://seajs.github.io/seajs/docs/#docs)的时候提出来的。

`CMD`与`AMD`挺相近，二者区别如下：
- 对于依赖的模块`CMD`是延迟执行，而`AMD`是提前执行（不过 RequireJS 从 2.0 开始，也改成可以延迟执行。 ）

- `CMD`推崇 **as lazy as possible（依赖就近）**，`AMD`推崇依赖前置。

- `AMD`的API默认是一个当多个用，`CMD`严格的区分推崇职责单一，其每个`API`都简单纯粹。例如：`AMD`里`require`分全局的和局部的。`CMD`里面没有全局的`require`，提供`seajs.use()`来实现模块系统的加载启动。

``` js
// module_a.js
define(function(require, exports, module) {
    console.log('module_a.js执行');
    console.log(require);
    console.log(exports);
    console.log(module);
});

// module_b.js
define(function(require, module, exports) {
    console.log('module_b.js执行');
    console.log(require);
    console.log(exports);
    console.log(module);
});

// index.js
define(function(require) {
    var a = require('module_a');
    var b = require('module_b');
    console.log(a);
    console.log(b);
});
```

## UMD

**Universal Module Definition, 通用模块规范**

因为`AMD`，`CommonJS`规范是两种不一致的规范，虽然他们应用的场景也不太一致，但是人们仍然是期望有一种统一的规范来支持这两种规范。于是，`UMD`规范诞生了，以解决跨平台问题。

客观来说，这个`UMD`规范看起来的确没有`AMD`和`CommonJS`规范简约。但是它支持`AMD`和`CommonJS`规范，同时还支持古老的全局模块模式。

`UMD`先判断是否支持`Node.js`的模块（`exports`）是否存在，存在则使用`Node.js`模块模式。再判断是否支持`AMD`（`define`是否存在），存在则使用`AMD`方式加载模块。

``` js
(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
      // AMD
      define(['jquery'], factory);
  } else if (typeof exports === 'object') {
      // Node, CommonJS-like
      module.exports = factory(require('jquery'));
  } else {
      // Browser globals (root is window)
      root.returnExports = factory(root.jQuery);
  }
}(this, function ($) {
  function myFunc(){};

  return myFunc;
}));
```

## ES6 Module

2015年6月，ES2015（即ECMAScript 6、ES6）正式发布。ES2015是该语言的一个显著更新，也是自2009年ES5标准确定后的第一个重大更新。

**虽然ES2015提出了许多令人激动的新特性，但由于目前JavaScript的运行环境众多，对ECMAScript标准的支持程度也不一样。**

一个模块就是一个独立的文件。该文件内部的所有变量，外部无法获取。

- `export`: 命令用于规定模块的对外接口。
- `import`: 命令用于输入其他模块提供的功能。

ES6模块的设计思想是尽量的静态化，**使得编译时就能确定模块的依赖关系，以及输入和输出的变量**。

``` js
// module_a.js
export function func1() {
  return {}
}

export function func2(params) {
  console.log(params)
}

// module_b.js
export {
  func1: function() {
    // ....
  },
  func2: function() {
    // ....
  }
}

// index.js
import { func1, func2 } from 'module_a'
// or
// import * as ma from 'module_a'

import mb from 'module_b'
```
