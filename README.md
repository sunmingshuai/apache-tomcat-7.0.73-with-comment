Tomcat源码导入idea步骤  
1.选择一个合适的工作空间 执行命令
既可以把源码当做一个工程对待 也可以把源码当做一个module对待
```ssh
git clone git@github.com:sunmingshuai/apache-tomcat-7.0.73-with-comment.git
```
2.当做普通的maven项目导入idea即可 例如我是当做一个module导入的  执行步骤:  
file->new->module from existing sources  
3.配置成可以debug的java工程  
run->edit configurations-> + ->application  
在右面的方框中 
Main class: org.apache.catalina.startup.Bootstrap  
Vm options: -Dcatalina.home="/Users/sunms/workspace/sourcecode/apache-tomcat-7.0.73-src/lunch"  
jre: 1.7

4.debug入口  
 BootStrap.main();