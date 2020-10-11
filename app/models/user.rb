class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, uniqueness: true
  validates :password, format: { with:/\A[a-zA-Z0-9]+\z/, message: "Password Include both letters and numbers" }
  validates :password_confirmation, presence:true
  validates :nickname, presence: true
  validates :birthday, presence: true
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "First name Full-width characters" }
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "Last name Full-width characters" }
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: "First name kana Full-width katakana characters" }
  validates :last_name_kana,  presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: "Last name kana Full-width katakana characters" }


end
