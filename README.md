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
2019-06-16 "上長権限追加前"
2019-06-16 "他ユーザー読取に"

$ git add -A
$ git commit -m "他ユーザー読取に"
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
20190616
上長権限属性を追加
rails g migration add_superior_to_users superior:boolean
マイグレーションファイル
  def change
    add_column :users, :superior, :boolean, default: false
  end
シード追加
User.create!(name: "上長01",
             email: "superior01@email.com",
             password: "password",
             password_confirmation: "password",
             superior: true)
User.create!(name: "上長02",
             email: "superior02@email.com",
             password: "password",
             password_confirmation: "password",
             superior: true)
User.create!(name: "上長03",
             email: "superior03@email.com",
             password: "password",
             password_confirmation: "password",
             superior: true)
rails db:migrate:reset
rails db:seed
管理者権限確認
User.first.admin?
User.find(2).admin?
上長権限確認
User.first.superior?
User.find(2).superior?
ユーザーカラム確認
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
もし日付が今日より未来または、ユーザーが一致しない場合は読み取り専用にする。
            <% if (Date.current < day.worked_on || !current_user?(@user)) %>
             <td><%= attendance.time_field :started_at, readonly: true, class: "form-control" %></td>
             <td><%= attendance.time_field :finished_at, readonly: true, class: "form-control" %></td>
            <% else %>
             <td><%= attendance.time_field :started_at, class: "form-control" %></td>
             <td><%= attendance.time_field :finished_at, class: "form-control" %></td>
            <% end %>