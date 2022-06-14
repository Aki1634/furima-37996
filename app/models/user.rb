class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         validates :nickname, presence: true

         with_options presence: true, format: { with: /\A[ぁ-ゔァ-ヴ\p{Ideographic}ａ-ｚＡ-Ｚ０-９]+\z/, message: 'に全角文字を使用してください' } do
         validates :last_name
         validates :first_name
         end

         validates :last_furigana, presence: true,
         format: {
           with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/,
           message: "全角カタカナのみで入力して下さい"
         }
         validates :first_furigana, presence: true,
         format: {
           with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/,
           message: "全角カタカナのみで入力して下さい"
         }
         validates :birth_day, presence: true

         validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: "は6文字以上かつ英数字をそれぞれ含めてください" }

        has_many :products
       # has_many :logs

end
