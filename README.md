# SSM_javaEE_Exam_System

## 项目环境
> 需要的软件 链接: https://pan.baidu.com/s/1dFhftHf 密码: y2qm

#### 1. IDE IDEA
> Intellj IDEA 15.0.6

#### 2. Tomcat
> windows_apache-tomcat-8.0.47

#### 3. redis
> Redis-x64-2.8.2402

相关配置
/resources/spring/spring-cache.xml
```
	 <bean id="jedisPoolConfig" class="redis.clients.jedis.JedisPoolConfig">
        <property name="maxIdle" value="100"/><!-- 最大闲置 -->
        <property name="minIdle" value="10"/><!-- 最小闲置 -->
        <property name="testOnBorrow" value="true"/><!-- 可以获取 -->
<!--        <property name="testOnReturn" value="true"/>-->
    </bean>
	<!-- redis 配置,也可以把配置挪到properties配置文件中,再读取 -->
	<bean id="jedisPool" class="redis.clients.jedis.JedisPool">
		<constructor-arg index="0" ref="jedisPoolConfig" />
		<!-- 端口，默认6379 -->
	    <constructor-arg index="2" value="6379"  name="port" type="int"/>
	    <constructor-arg index="3" value="5000"  name="timeout" type="int"/>
	    <constructor-arg index="1" value="127.0.0.1" name="host" type="java.lang.String"/>
	    <!-- 如果你需要配置密码，请打开这里。
	        <constructor-arg index="4" value="你的密码" name="password" type="java.lang.String"/>
	    -->
	</bean>
	<!--
		这种 arguments 构造的方式，之前配置有缺点。
		这里之前的配置有问题，因为参数类型不一致，有时候jar和环境的问题，导致参数根据index对应，会处理问题，
		理论上加另一个 name，就可以解决，现在把name 和type都加上，更保险。
	 -->
```
相关代码
> com.core.shiro.cache

#### 4. nginx
> nginx-1.10.2

相关配置

\nginx-1.10.2\conf
```
server {
        #prot
        listen       8888;
        server_name  localhost;

        location / {
            root   html;
            index  index.html index.htm;
        }

        location ~ \.(gif|jpg|jpeg|png|bmp|swf)$ {
            #默认的图片路径,也是ftp上传文件存放的路径,只要后缀是以上的都会到这个路径下搜索
            root         G:/JAVAEE/FtpUpload/;
        }

    }
```

/resources/config.properties

```
#FTP配置
ftp.server.ip=127.0.0.1
ftp.user=root
ftp.pass=123456
ftp.server.http.prefix=http://127.0.0.1:8888/img/
```

#### mysql 5.7.11
#### 字符编码  utf-8
#### JDK 1.8
#### Spring 4.2.5
#### Shiro 权限控制框架
>配置文件

```
<property name="filterChainDefinitions" >
	<value>
		/** = anon
		/page/login.jsp = anon
		/page/register/* = anon
		/page/index.jsp = authc
		/page/addItem* = authc,roles[数据管理员]
		/page/file* = authc,roleOR[普通用户,数据管理员]
		/page/listItems* = authc,roleOR[数据管理员,普通用户]
		/page/showItem* = authc,roleOR[数据管理员,普通用户]
		/page/updateItem*=authc,roles[数据管理员]
          </value>
</property>
```

#### 用户密码加密
> MD5(登录帐号 + “固定值” + 密码)

```
//Java代码。UserManager.md5Pswd(UUser user);
/**
 * 加工密码，和登录一致。
 * @param user
 * @return
 */
public static UUser md5Pswd(UUser user){
	//密码为   email + '#' + pswd，然后MD5
	user.setPswd(md5Pswd(user.getEmail(),user.getPswd()));
	return user;
}
/**
 * 字符串返回值
 * @param email
 * @param pswd
 * @return
 */
public static String md5Pswd(String email ,String pswd){
	pswd = String.format("%s#%s", email,pswd);
	pswd = MathUtil.getMD5(pswd);
	return pswd;
}
```


#### 本项目框架 SSM（SpringMVC + Spring + Mybatis）
#### View层主要是Freemarker，并且框架支持Freemarker 和 JSP 双View展示（优先找Freemarker）。


#### 项目的功能

1. 基于Shiro 的权限管理
    * Shiro 初始权限动态加载。
    * Shiro 自定义权限校验Filter定义，及功能实现
    * Shiro Ajax请求权限不满足，拦截后解决方案
    * Shiro Freemarker标签使用。
    * Shiro 登录后跳转到最后一个访问的页面。

2. 用户管理
    * 用户禁止登录Demo。
    * 在线显示，在线用户管理（踢出登录）。
    * 登录注册密码加密传输。
    * 密码修改。
    * 用户个人中心。
    * 权限的增删改查。
    * 角色的增删改查。
    * 权限->角色->用户之间的关系维护。
    * 管理员权限的自动添加（当有一个权限创建，自动添加到管理员角色下，保证管理员是最大权限）。
    * 一个帐号多处登录限制，踢出用户。

3. 考试中心
    * 试题的增删改查。
    * 考试项目的增删改查。
    * 考试科目的增删改查。
    * 科目章节的增删改查。
    * 随机生成考卷。
    * 查看考卷的列表和详细信息。
    * 查看答题列表和详细信息（包括错题和对题分数等）。

4. 消息中心