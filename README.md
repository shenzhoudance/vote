
# 构建一个专案
rails new vote
cd vote
git init
git add .
git commit -m "first commit"

# 构建一个功能
rails generate scaffold topic title:string description:text
rake db:migrate
