class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i

  with_options presence: true do
  validates :nickname
  validates :password, format: { with: VALID_PASSWORD_REGEX, message: 'Include both letters and numbers' }
  validates :last_name, :first_name, format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/, message: 'Full-width characters' } # ユーザー本名は全角 （漢字・ひらがな・カタカナ）
  validates :last_name_kana, :first_name_kana, format: { with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/, message: 'Full-width katakana characters' }
  validates :user_birth_date
  end

  has_many :items, dependent: :destroy
  has_many :transaction_items
end
