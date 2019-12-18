---
title: Web类型
date: 2019-12-05 14:00:00
---

# {{ $page.title }}

## Static/Dynamic

> [静态web和动态web的区别与联系](https://blog.csdn.net/mooreliu/article/details/45563227)

> [Applet和Servlet有什么区别？](https://blog.51cto.com/wushank/1678280)

**Java Applet**: 一种Java程序。它一般运行在支持Java的Web浏览器内。因为它有完整的Java API支持, 所以Applet是一个全功能的Java应用程序。

**Java Servlet**: 创建基于Web的应用程序提供了基于组件、独立于平台的方法，可以不受CGI程序的性能限制。Servlet有权限访问所有的Java API，包括访问企业级数据库的JDBC API。

## MPA/SPA

> [认识单页应用（SPA）与多页应用（MPA）](https://juejin.im/post/5d6b47b36fb9a06b1027419a)

> [MPA 與 SPA](https://ithelp.ithome.com.tw/articles/10202427)

> [Ultimate DEATH Match: SPA Vs. MPA](https://medium.com/@jainshilpa1993/ultimate-death-match-spa-vs-mpa-82e0b79ae6b6)

> [SINGLE PAGE APPLICATION (SPA) VS MULTI PAGE APPLICATION (MPA): PROS AND CONS](https://merehead.com/blog/single-page-application-vs-multi-page-application/)

### 多页面应用(MPA, Multi-page Application)

传统的`HTML`网页设计，早期的网站都是这样的设计，称为 **网页设计**。每一次请求响应一个`html`页面。

![MPA](./images/multi-page.png)

### 单页面应用(SPA, Single-page Application)

第一次进入页面的时候会请求一个`html`文件，刷新清除一下。切换到其他组件，此时路径也相应变化，但是并没有新的`html`文件请求，页面内容也变化了。

原理: `js`感知`url`变化。动态的将当前呈现的**组件**内容清除掉, 然后将下一个**组件**的内容挂载到当前页面上, 此刻的**路由**与后端无关, 为前端自己实现。这种过程就是单页面应用, 每次跳转时不再需要请求`html`文件。

![SPA](./images/single-page.png)
