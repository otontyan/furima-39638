class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # 正規表現（氏名）
  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ } do
    validates :family_name_kanji
    validates :personal_name_kanji
  end

  # 正規表現（カナ）
  with_options presence: true, format: { with: /[\p{katakana} ー－&&[^ -~｡-ﾟ]]+/ } do
    validates :family_name_kana
    validates :personal_name_kana
  end

  validates :nick_name, presence: true
  validates :birthdate, presence: true
  # 正規表現（パスワード）
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }

  has_many :items
  has_many :buys
end
