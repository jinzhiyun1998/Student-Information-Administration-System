## Brief Introduction
这个项目是一个大学生信息管理系统,提供用户级别的登录注册资料管理,信息查询,信息修改（管理员权利），简单的数据可视化分析等功能，也有基本的安全性保障

* SpringBoot+Mybatis分支：[https://github.com/KuroChan1998/Student-Information-Administration-System/tree/Sb_M](https://github.com/KuroChan1998/Student-Information-Administration-System/tree/Sb_M)
* SpringBoot+Mybatis+Dubbo+Zookeeper分支：[https://github.com/KuroChan1998/Student-Information-Administration-System/tree/Sb_M_D_Z](https://github.com/KuroChan1998/Student-Information-Administration-System/tree/Sb_M_D_Z)

## Release Notes

对`Redis`和`SpringAOP`不太熟的初学者，下载[v1.1.0](https://pan.baidu.com/s/1yHjrk7gAycHRFapU_Waf4g)版本足够学习或完成课设了~([更多历史版本](#update_history))

### v1.3.0 - 2019.10.14 (Current Version)

*版本1.3.0，提升安全性，解决部分安全隐患 :*

- 前端layUi数据表格，增加“筛选列”、“打印”、“导出”上方工具条。
- 新增CsrfInterceptor拦截器，对修改请求进行CsrfToken的校验，有效防止CSRF攻击
- 对注册用户信息后端服务层，强化在aop方法中对输入身份属性的校验，对“管理员”字段进行过滤，并抛出异常，防止攻击者拦截请求JSON数据进行修改以获得非法权限；对修改用户信息后端控制层，强化在UserController对应方法中对原身份属性和修改后身份属性的校验，对“管理员”字段进行过滤，防止攻击者拦截请求JSON数据进行修改以获得非法权限。
- 感谢@[Mydearbaby](https://github.com/Mydearbaby)发现的[邮箱验证码绕过安全漏洞](https://github.com/KuroChan1998/Student-Information-Administration-System/issues/3)，在服务端发送验证码时新增一个标志位false，仅当服务端校验正确后才将此标志置true，可以有效避免攻击者拦截请求JSON数据进行修改以绕开验证码。





## Technologies Used
### 前端
* 前端框架 : `layui`
* 数据可视化框架 : `echarts`

### 后端
* IOC容器 : `Spring`
* MVC框架 : `SpringMVC`
* ORM框架 : `Mybatis`
* 缓存技术：`Redis`
* 数据库：`Mysql`
* 日志框架 : `Log4j`

## Project Structure
```
├─database                          // 数据库相关文件
│  ├─design				                  // 数据库设计
│  │  └─1
│  └─sql                            // 数据库初始化脚本文件
├─git_screenshot                    // 存放README.md 中的图片
├─src                               // 项目源代码目录
│  ├─main                           //源代码目录
│  │  ├─java
│  │  │  └─com
│  │  │      └─jzy          // java代码目录
│  │  │          ├─controller       // 控制层
│  │  │          ├─dao              // 持久层
│  │  │          ├─dto              // 传输对象
│  │  │          ├─entity           // 实体类
│  │  │          ├─exception        // 自定义异常类
│  │  │          ├─interceptor      // 拦截器
│  │  │          ├─log              // 日志管理
│  │  │          ├─service          // 服务层
│  │  │          │  └─impl          // 服务层接口实现
│  │  │          └─util             // 工具方法
│  │  ├─resources                   // 资源文件目录
│  │  │  └─com
│  │  │      └─jzy
│  │  │          └─mapper           // mybatis对dao接口的xml实现
│  │  └─webapp                      // tomcat前端文件目录
│  │      ├─static                  // 静态资源
│  │      │  ├─custom               // 自定义静态资源
│  │      │  └─plugins              // 插件类静态资源
│  │      └─WEB-INF
│  │          └─page                // jsp页面目录 
│  └─test                           // 测试代码目录
├─README.md                         // help
├─ISSUES.md                         // 问题大全
└─pom.xml                           // maven依赖
```


## Quick Start
### 1 : 项目开发环境
- IDE : `IntelliJ IDEA 2018.1.7`
- 项目构建工具 : `Maven 3.x`
- 数据库 : `Mysql 8.0.13`
- Redis：`Redis server 3.2.100`
- JDK版本 : `jdk 1.8`
- Tomcat版本 : `Tomcat 8.x`


### 2 : 项目的初始构建
1. *在你的Mysql中，运行我提供的database/sql/init.sql 文件（注意mysql版本与sql脚本中部分代码的兼容性）, 成功会创建名为mydatabase2的数据库，以及user、student、teacher、class、major、college、title、grade八个表*

*数据库物理模型如下 :*

![Snipaste_2019-07-17_09-48-36](git_screenshot/Snipaste_2019-07-17_09-48-36.jpg)

2. *进入src/main/resources修改dbconfig.properties配置文件,把数据库主机、端口、用户名和密码，改为你本地的*

   ```properties
   #mysql
   jdbc.driver=com.mysql.cj.jdbc.Driver
   #你的mysql连接url，localhost(本机)，端口：3306（默认），数据库：mydatabase2（上一步完成创建）
   jdbc.url=jdbc:mysql://localhost:3306/mydatabase2?useUnicode=true&characterEncoding=utf8&serverTimezone=GMT%2B8&useSSL=false
   #你的mysql用户名
   jdbc.username=root
   #你的mysql密码
   jdbc.password=123
   ```

3. *进入src/main/resources修改redis.properties配置文件,把数据库主机、端口、用户名和密码，改为你本地的*

   ```properties
   #你的redis主机地址
   redis.host=localhost
   #你的redis端口
   redis.port=6379
   #你的redis密码
   redis.password=123
   ```

4. *进入src/main/resources查看log4j.properties，如果有必要可以修改日志输出路径，目前在D盘下，你可选择不修改跳过此步*

5. *使用 IntelliJ IDEA 导入项目，选择Maven项目选项，一路点击next，即可将项目所需依赖导入（若依赖下载速度较慢，请参考百度更改国内镜像）。若有无法引入的依赖，可能是因为maven版本不同或是该依赖已过时不存在于现有maven仓库中，请前往maven官网映入最新的该类型依赖*

![Snipaste_2019-07-17_08-47-37](git_screenshot/Snipaste_2019-07-17_08-47-37.jpg)

![Snipaste_2019-07-17_08-49-48](git_screenshot/Snipaste_2019-07-17_08-49-48.jpg)

5. *在 IntelliJ IDEA 中，配置我们的 Tomcat， 然后把使用Maven构建好的项目添加到Tomcat中，操作比较简单，相关方法可以参考百度*

6. *运行项目，进入用户登录页面*

![Snipaste_2019-05-04_08-02-50](git_screenshot/Snipaste_2019-05-04_08-02-50.jpg)


7. *登录账户/密码(你也可以自行注册一个账户登录哟)*
  - 管理员账户：000000000000/admin1
  - 学生账户：516030910429/123456
  - 教师账户：1000000001/123456

### 3：项目的打包

* 在配置好maven的环境变量的前提下，在项目根目录下cmd打开命令行，输入 `mvn clean package`，即可在target/目录下得到相应war包。

* 将war手动部署到tomcat的webapp目录下（手动部署的方式可以参考百度，这里不详述），也可得到第二步一样的运行结果。



## Detailed Functions
### 用户服务
* 登录：如上文图所示

* 注册

  ![Snipaste_2019-05-04_08-11-21](git_screenshot/Snipaste_2019-05-04_08-11-21.jpg)

* 忘记密码后的重置密码（含发送邮箱验证码）

  ![Snipaste_2019-05-04_08-12-27](git_screenshot/Snipaste_2019-05-04_08-12-27.jpg)

* 登录进入主页

  ![Snipaste_2019-09-12_10-35-03](git_screenshot/Snipaste_2019-09-12_10-35-03.jpg)

* 修改基本资料

  ![Snipaste_2019-07-04_08-19-12](git_screenshot/Snipaste_2019-07-04_08-19-12.jpg)

* 修改密码

  ![Snipaste_2019-07-17_09-23-03](git_screenshot/Snipaste_2019-07-17_09-23-03.jpg)

* 修改绑定邮箱

  ![Snipaste_2019-07-17_09-30-38](git_screenshot/Snipaste_2019-07-17_09-30-38.jpg)


### 信息查询
* 学生信息查询

  * 查询所有信息

    ![Snipaste_2019-07-17_09-31-05](git_screenshot/Snipaste_2019-07-17_09-31-05.jpg)

  * 根据登录用户的用户名（应以学号注册）查询当前个人的学籍信息，若注册时未以真实学号注册，则无法查询到。

    ![Snipaste_2019-07-17_09-32-12](git_screenshot/Snipaste_2019-07-17_09-32-12.jpg)

  * 模糊查询搜索

    ![Snipaste_2019-07-17_09-32-47](git_screenshot/Snipaste_2019-07-17_09-32-47.jpg)

* 教师信息查询：类似学生信息查询，图略

* 班级信息查询：类似学生信息查询，图略

* 专业&学院信息查询：类似学生信息查询，图略


### 信息修改
* 学生信息修改

  * 此功能必须以管理员用户身份登录，否则会跳转至异常页面

    ![Snipaste_2019-05-04_08-32-13](git_screenshot/Snipaste_2019-05-04_08-32-13.jpg)

  * 编辑信息

    ![Snipaste_2019-07-17_09-33-51](git_screenshot/Snipaste_2019-07-17_09-33-51.jpg)

  * 添加

    ![Snipaste_2019-07-17_09-34-24](git_screenshot/Snipaste_2019-07-17_09-34-24.jpg)

  * 单条、多条删除

    ![Snipaste_2019-07-17_09-34-56](git_screenshot/Snipaste_2019-07-17_09-34-56.jpg)

* 教师信息修改：类似学生信息修改，图略

* 班级信息修改：类似学生信息修改，图略

* 专业&学院信息修改：类似学生信息修改，图略


### 拓展功能
* 学生男女比可视化

![Snipaste_2019-07-17_09-36-37](git_screenshot/Snipaste_2019-07-17_09-36-37.jpg)

* 学生人数比可视化

![Snipaste_2019-07-17_09-37-17](git_screenshot/Snipaste_2019-07-17_09-37-17.jpg)

![Snipaste_2019-07-26_17-10-43](git_screenshot/Snipaste_2019-07-26_17-10-43.jpg)

* 师资力量可视化

  ![Snipaste_2019-07-26_17-12-36](git_screenshot/Snipaste_2019-07-26_17-12-36.jpg)

## <span id='update_history'>Update History</span>

### v1.2.0 - 2019.9.12

*版本1.2.0，更新如下内容 :*

- 修复了前端编辑添加弹窗在不同分辨率客户机上的显示大小问题
- 新增Redis技术，用以缓存用户名密码，用户错误登录次数限制，邮箱验证码等等
- 新增连续输错用户名密码超过一定次数后的限制时间
- 更改了邮箱验证码有效时间的实现方式，由服务端java实现改为redis过期时间实现
- 提升了服务端的安全性和新增异常处理机制，用aop实现入参的校验，对不合法的请求及其参数值用日志记录，并抛出异常
- 优化了util包等源代码的结构，增强了可拓展性

Download: [https://github.com/KuroChan1998/Student-Information-Administration-System/tree/v1.2.0](https://github.com/KuroChan1998/Student-Information-Administration-System/tree/v1.2.0)

### v1.1.0 - 2019.7.27

*版本1.1.0，更新如下内容 :*

- 优化数据表结构，对原有的表的部分字段进行了修改，并增加了title和grade两个表
- 优化sql语句效率
- 优化前端查询界面及查询方式，使其更加全面，对用户友好
- 更新登录界面记住密码的cookie设置
- 更新邮箱验证码服务，增加了验证码有效时间
- 优化源代码结构，增强了规范性和可拓展性

Download: [https://pan.baidu.com/s/1yHjrk7gAycHRFapU_Waf4g](https://pan.baidu.com/s/1yHjrk7gAycHRFapU_Waf4g)

### v1.0.0 - 2019.5.19

*StuInfoAdmin-v1.0.0 的一切准备工作似乎都已到位。发布之弦，一触即发。*
*不枉近百个日日夜夜与之为伴。因小而大，因弱而强。*

*无论它能走多远，抑或如何支撑？至少我曾倾注全心，无怨无悔*

Download: [https://pan.baidu.com/s/1piVQnIFdz_BIoszIEzAJwQ](https://pan.baidu.com/s/1piVQnIFdz_BIoszIEzAJwQ)

## Contact me

- qq: 929703621
- wechat: Jzy_bb_1998
- e-mail: 929703621@qq.com
- soul: despacito

欢迎提出意见与建议~