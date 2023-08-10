class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   validates :nick_name, presence: true
   validates :family_name_kanji, presence: true
   validates :personal_name_kanji, presence: true
   validates :family_name_kana, presence: true
   validates :personal_name_kana, presence: true
   validates :birthdate, presence: true
end
