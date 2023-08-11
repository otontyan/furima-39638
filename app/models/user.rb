class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ } do
     validates :family_name_kanji
     validates :personal_name_kanji
   end

   with_options presence: true, format: { with: /[\p{katakana} ー－&&[^ -~｡-ﾟ]]+/ } do
    validates :family_name_kana
    validates :personal_name_kana
  end
        
   validates :nick_name, presence: true
   validates :birthdate, presence: true
   validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }

   
end
