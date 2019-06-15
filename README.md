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

$ git add -A
$ git commit -m "新誰勤 勤怠B 実装"
$ git checkout master
$ git push
