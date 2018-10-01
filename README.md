
# 构建一个专案
```
rails new vote
cd vote
本地新建一个专案

git init
git add .
git commit -m "first commit"
将专案放入代码管理系统

git remote add origin https://github.com/shenzhoudance/vote.git
git push -u origin master
将专案推送到云端代码管理

heroku new
heroku master push
将本地的代码推送到云端服务器，完成产品的全球化访问;


(1)在全球化访问的过程中，就是一个数据化管理和空间化的存储问题
(2)数据的整理就是有价值的财富，云端服务所形成的使用价值就是价值；
(3)在单位时间里面产品价值交换的频率越快，云端服务的频次越高；
(4)云端化产品苏打造的产品的价值体系也就越大，就构成了一个盈利的公司体系架构！
(5)在产品优化的情况下，就是运营和公司化的管理成为主要构成部分；

互联网的产品的前期是产品为核心，在产品稳定的情况下，就是运营和行政为核心，而所有的运营和行政的本质都是为产品而服务，只有始终将注意力集中在对于产品的打造上面，集中在有价值的人才上面，公司的运营和行政的存在才是真正有价值的存在。，不然没有产品的公司，最终都会面临倒闭和淘汰！

```
# 构建一个功能
```
rails generate scaffold topic title:string description:text
rake db:migrate
```
# 添加一个首页的路由
```
root 'topics#index'
```
