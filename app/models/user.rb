class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items

  validates :email, uniqueness: true
  validates :password, format: { with: /\A[a-zA-Z0-9]+\z/, message: 'Password Include both letters and numbers' }
  validates :password_confirmation, presence: true
  validates :nickname, presence: true
  validates :birthday, presence: true
  NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/.freeze
  validates :first_name, presence: true, format: { with: NAME_REGEX, message: 'First name Full-width characters' }
  validates :last_name, presence: true, format: { with: NAME_REGEX, message: 'Last name Full-width characters' }
  KANA_REGEX = /\A[ァ-ヶー－]+\z/.freeze
  validates :first_name_kana, presence: true, format: { with: KANA_REGEX, message: 'First name kana Full-width katakana characters' }
  validates :last_name_kana,  presence: true, format: { with: KANA_REGEX, message: 'Last name kana Full-width katakana characters' }
end
