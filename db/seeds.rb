# coding: utf-8

User.create!(name: "管理 志太郎",
             email: "sample@email.com",
             password: "password",
             password_confirmation: "password",
             admin: true)
             
User.create!(name: "上長 一郎",
             email: "superior01@email.com",
             password: "password",
             password_confirmation: "password",
             superior: true)
User.create!(name: "上長 二郎",
             email: "superior02@email.com",
             password: "password",
             password_confirmation: "password",
             superior: true)
User.create!(name: "上長 三郎",
             email: "superior03@email.com",
             password: "password",
             password_confirmation: "password",
             superior: true)

12.times do |n|
  name  = Faker::Name.name
  email = "sample-#{n+1}@email.com"
  password = "password"
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password)
end