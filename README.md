# 勤怠システムを開発しよう！

これはセレブエンジニアサロンの教材で作られたサンプルアプリケーションです。

## 開発環境

* AWS Cloud9
* Ruby
* Rails
* Git

            <% if !current_user.admin? && (Date.current < day.worked_on) %>
             <td><%= attendance.time_field :started_at, readonly: true, class: "form-control" %></td>
             <td><%= attendance.time_field :finished_at, readonly: true, class: "form-control" %></td>
            <% else %>
             <td><%= attendance.time_field :started_at, class: "form-control" %></td>
             <td><%= attendance.time_field :finished_at, class: "form-control" %></td>
            <% end %>
            
        <% css_class = case %w{日 月 火 水 木 金 土}[day.worked_on.wday]
        when '土'
          'text-primary'
        when '日'
          'text-danger'
        end %>
        
<%= $days_of_the_week[day.worked_on.wday] %>

2019-06-15 "新誰勤 勤怠B 実装"
2019-06-16 "残業申請モーダル表示"

$ git add -A
$ git commit -m "残業申請モーダル表示"
$ git checkout master
$ git push

参考先人勤怠
URL
https://still-springs-20823.herokuapp.com/
管理者
email:example@railstutorial.org
PW:foobar
上長1
email:example1@railstutorial.org
PW:foobar
上長2
email:example2@railstutorial.org
PW:foobar
一般ユーザ
email:example-1@railstutorial.org
PW:password
ユーザ読込用CSVの中身
id,name,email,affiliation,uid,cardID,basictime,workingtime,working_time_End,superior,admin,password
100,上長10,example10@railstutorial.org,上長,1,1,08:00,09:00,18:00,TRUE,FALSE,password

社員番号
employee_number
カード番号
uid
指定勤務終了時間
designated_work_end_time
上長
superior
カラム確認
rails c
User.column_names
リポジトリを確認
git remote -v
リポジトリの変更
git remote set-url origin url
git add -A
git commit -m ""
git push
git push --set-upstream origin master
クローンから起動できるまで
git clone url
bundle install --without production
bin/rails db:migrate RAILS_ENV=development
2.6.3 :001 > User.column_names
 => ["id", "name", "email", "created_at", "updated_at", "password_digest", "remember_digest", "admin", "department", "basic_time", "work_time"] 
2.6.3 :002 > quit

<%= link_to "基本情報編集", edit_basic_info_user_path(user), remote: true, class: "btn btn-success" %>
モーダルウインドウ表示
<div id="edit-basic-info" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true"></div>