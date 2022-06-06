require 'rails_helper'
 RSpec.describe User, type: :model do
   describe "ユーザー新規登録" do
     it "nicknameが空だと登録できない" do
       user = User.new(nickname: "", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", first_name: "あ", last_name: "あ", first_furigana: "ア", last_furigana: "ア", birth_day: "1930-01-01")
       user.valid?
       expect(user.errors.full_messages).to include("Nickname can't be blank")
     end
     it "emailが空では登録できない" do
       user = User.new(nickname: "a", email: "", password: "00000000", password_confirmation: "00000000", first_name: "あ", last_name: "あ", first_furigana: "ア", last_furigana: "ア", birth_day: "1930-01-01")
       user.valid?
       expect(user.errors.full_messages).to include("Email can't be blank")
     end
     it "first_nameが空だと登録できない" do
      user = User.new(nickname: "a", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", first_name: "", last_name: "あ", first_furigana: "ア", last_furigana: "ア", birth_day: "1930-01-01")
      user.valid?
      expect(user.errors.full_messages).to include("First_name can't be blank")
     end
     it "last_nameが空だと登録できない" do
      user = User.new(nickname: "a", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", first_name: "あ", last_name: "", first_furigana: "ア", last_furigana: "ア", birth_day: "1930-01-01")
      user.valid?
      expect(user.errors.full_messages).to include("Last_name can't be blank")
     end
     it "first_furiganaが空だと登録できない" do
      user = User.new(nickname: "a", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", first_name: "あ", last_name: "あ", first_furigana: "", last_furigana: "ア", birth_day: "1930-01-01")
      user.valid?
      expect(user.errors.full_messages).to include("First_furigana can't be blank")
     end
     it "last_furiganaが空だと登録できない" do
      user = User.new(nickname: "a", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", first_name: "あ", last_name: "あ", first_furigana: "ア", last_furigana: "", birth_day: "1930-01-01")
      user.valid?
      expect(user.errors.full_messages).to include("Last_furigana can't be blank")
     end
     it "birth_dayが空だと登録できない" douser = User.new(nickname: "a", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", first_name: "あ", last_name: "あ", first_furigana: "ア", last_furigana: "ア", birth_day: "")
      user.valid?
      expect(user.errors.full_messages).to include("Birth_day can't be blank")
     end
    
   end
 end
