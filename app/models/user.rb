class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many   :products
  has_one    :order
  with_options presence: true do
    validates :nickname 
    validates :family_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "Full-width characters."}
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "Full-width characters."}
    validates :family_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "Full-width katakana characters."}
    validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "Full-width katakana characters."}
    validates :birth_date
  end
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z{6,}/i, message: "Include both letters and numbers"}
  #length: { minimum: 6 , message: "is too short (minimum is 6 characters)"}
  # message: validates :email  "メールアドレスに「＠」を入れてください。#{@user.email}内に「@」がありません"
end
