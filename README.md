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
2019-06-16 "上長権限追加"
2019-06-17 "残業申請追加前"
2019-06-17 "Accordion partial layout"
2019-06-17 "試し"
2019-06-21 "ユーザーカラム追加前"

$ git add -A
$ git commit -m "ユーザーカラム追加前"
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
モーダル
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#sampleModal">
            	【所属長承認申請のお知らせ】
            </button>
            <!-- モーダル・ダイアログ -->
            <div class="modal fade" id="sampleModal" tabindex="-1">
            	<div class="modal-dialog">
            		<div class="modal-content">
            			<div class="modal-header">
            				<button type="button" class="close" data-dismiss="modal"><span>×</span></button>
            				<h4 class="modal-title">【暫定】</h4>
            			</div>
            			<div class="modal-body">
                          <table class="table table-bordered table-condensed table-hover" id="table-attendances">
                          </table>
            			</div>
            			<div class="modal-footer">
            				<button type="button" class="btn btn-default" data-dismiss="modal">戻る</button>
            				<button type="button" class="btn btn-primary">変更を送信する</button>
            			</div>
            		</div>
            	</div>
            </div>
            
rails generate migration CreateAttendances finished_plan_at:datetime business_content:string user:references
rails g model Attendance finished_plan_at:datetime business_content:string user:references

<section>

  <button type="button" class="btn btn-primary btn-sm" data-toggle="collapse" data-target="#sample-<%= user.id %>">コンテンツを開く </button>
  <div id="sample-<%= user.id %>" class="collapse">
    <div class="panel panel-default">
      <div class="panel-body">
      
      
      
      
        <p>コメントコメントコメントコメントコメントコメントコメント </p>
      </div>
    </div>
  </div>
</section>
<hr>
<section>
  <h2>コンテンツを最初から表示</h2>
  <button type="button" class="btn btn-primary btn-sm" data-toggle="collapse" data-target="#sample2">コンテンツを開く </button>
  <div id="sample2" class="collapse in">
    <div class="panel panel-default">
      <div class="panel-body">
        <h3>アコーディオンの中身</h3>
        <p>コメントコメントコメントコメントコメントコメントコメント </p>
      </div>
    </div>
  </div>
</section>

<!--モーダルウインドウ表示-->
<div id="edit-basic-info" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true"></div>

            <%= link_to user.name, user %>

Attendance.column_names
rails g model Attendance finished_plan_at:datetime

<div class="panel-group">
  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a data-toggle="collapse" href="#collapse1">基本情報編集</a>
      </h4>
    </div>
    <div id="collapse1" class="panel-collapse collapse">
      <div class="panel-body">内容</div>
      <div class="panel-footer">フッター</div>
    </div>
  </div>
</div>

    <%= link_to "基本情報編集", edit_basic_info_user_path(user), remote: true, class: "btn btn-primary" %>        
            
        <td class="center"><%= user.department.present? ? user.department : "未所属" %></td>
        <% if current_user.admin? %>
          <td class="center"><%= format_basic_info(user.basic_time) %></td>
          <td class="center"><%= format_basic_info(user.work_time) %></td>
        <% end %>
        
    <thead>
      <tr>
        <th><%= User.human_attribute_name :name %></th>
        <th class="center"><%= User.human_attribute_name :department %></th>
        <% if current_user.admin? %>
          <th class="center"><%= User.human_attribute_name :basic_time %></th>
          <th class="center"><%= User.human_attribute_name :work_time %></th>
        <% end %>
        <th></th>
      </tr>
    </thead>
    
        <td class="center"><%= user.department.present? ? user.department : "未所属" %></td>
        <% if current_user.admin? %>
          <td class="center"><%= format_basic_info(user.basic_time) %></td>
          <td class="center"><%= format_basic_info(user.work_time) %></td>
        <% end %>
        
rails generate controller TameshiPages tameshi

<% @users.each do |user| %>
	<%= render "errors" %>
	<%= user.name %>
	.
	.
<% end %>
	
#_errorsパーシャルの中身は@userを参照しているので、
#<%= render "errors", @user: user %>みたいな感じでどうでしょうか？

rails g model Attendance finished_plan_at:datetime user:references

     <%= link_to "基本情報編集", edit_basic_info_user_path(user), remote: true, class: "btn btn-primary btn-lg btn-block" %> 
     
                    <%= render "edit_basic_info" %>
                    
string 文字列型
text テキスト（不定長文字列）型
integer 整数型
float 浮動小数点数型
decimal 固定長整数型
datetime 日時型
timestamp タイムスタンプ型
time 時刻型
date 日付型
binary バイナリ文字列型
boolean 真偽値型
references 他のテーブルへの外部キーの定義、_id が付いた整数