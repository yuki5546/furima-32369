class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i

  validates :nickname, presence: true
  validates :password, format: { with: VALID_PASSWORD_REGEX, message: 'Include both letters and numbers' }
  validates :last_name, :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'Full-width characters' } # ユーザー本名は全角 （漢字・ひらがな・カタカナ）
  validates :last_name_kana, :first_name_kana, presence: true,
                                               format: { with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/, message: 'Full-width katakana characters' }
  validates :first_name_kana, presence: true
  validates :user_birth_date, presence: true

  has_many :items, dependent: :destroy
  has_many :transaction_items
end
