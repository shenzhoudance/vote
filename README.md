
![](https://ws2.sinaimg.cn/large/006tNc79ly1fvsjfnxv2qg30tl0g3tob.gif)
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
git push heroku master
heroku run rake db:migrate
heroku open
将本地的代码推送到云端服务器，完成产品的全球化访问;
```
# 对于产品体系的思考
```
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

# 对于每一笔资料完成投票
rails generate model newvote topic_id:integer
rake db:migrate

# 专案的数据和投票对接
app/models/topic.rb
```
class Topic < ApplicationRecord
  has_many :newvotes, dependent: :destroy
end
```
app/models/newvote.rb
```
class Newvote < ApplicationRecord
  belongs_to :topic
end
```

增加 controller 的控制器的代码

```
class TopicsController < ApplicationController
  before_action :set_topic, only: [:show, :edit, :update, :destroy]


def upvote
  @topic = Topic.find(params[:id])
  @topic.newvotes.create
  redirect_to(topics_path)
end
  # GET /topics
  # GET /topics.json
  def index
    @topics = Topic.all
  end

  # GET /topics/1
  # GET /topics/1.json
  def show
  end

  # GET /topics/new
  def new
    @topic = Topic.new
  end

  # GET /topics/1/edit
  def edit
  end

  # POST /topics
  # POST /topics.json
  def create
    @topic = Topic.new(topic_params)

    respond_to do |format|
      if @topic.save
        format.html { redirect_to topics_path, notice: 'Topic was successfully created.' }
        format.json { render :show, status: :created, location: @topic }
      else
        format.html { render :new }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /topics/1
  # PATCH/PUT /topics/1.json
  def update
    respond_to do |format|
      if @topic.update(topic_params)
        format.html { redirect_to @topic, notice: 'Topic was successfully updated.' }
        format.json { render :show, status: :ok, location: @topic }
      else
        format.html { render :edit }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /topics/1
  # DELETE /topics/1.json
  def destroy
    @topic.destroy
    respond_to do |format|
      format.html { redirect_to topics_url, notice: 'Topic was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_topic
      @topic = Topic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def topic_params
      params.require(:topic).permit(:title, :description)
    end
end

```
app/views/topics/index.html.erb
```
<p id="notice"><%= notice %></p>

<h1>Topics</h1>

<table>
  <thead>
    <tr>
      <th>Title</th>
      <th>Description</th>
      <th colspan="3"></th>
    </tr>
  </thead>

  <tbody>
    <% @topics.each do |topic| %>
      <tr>
        <td><%= link_to topic.title, topic %></td>
        <td><%= topic.description %></td>
        <td><%= topic.newvotes.count %></td>
        <td><%= button_to '赞赏', upvote_topic_path(topic) , method: :opst %></td>
        <td><%= link_to '删除', topic, method: :delete, data: { confirm: 'Are you sure?' } %></td>
      </tr>
    <% end %>
  </tbody>
</table>

<br>

<%= link_to 'New Topic', new_topic_path %>
```
