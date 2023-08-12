require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end
    # 済
    it 'nick_nameが空では登録できない' do
      @user.nick_name = '' 
      @user.valid?
      expect(@user.errors.full_messages).to include("Nick name can't be blank")
    end
    # 済
    it 'emailが空では登録できない' do
      @user.email = '' 
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    # ２人目を作成する必要あり！
    it 'emailが一意性であること' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    # 済
    it 'emailに@が必要であること' do
      @user.email = 'aaabbb' 
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    # 済
    it 'passwordが空では登録できない' do
      @user.password = '' 
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    # 済
    it 'passwordの値が適切でない' do
      @user.password = '111111' 
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    # 済
    it 'passwordが6文字以上でないと登録できない' do
      @user.password_confirmation = '1111' 
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    # 済
    it 'passwordとpassword_confirmationが一致しないと登録できない' do
      @user.password_confirmation = '' 
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    # 済
    it 'family_name_kanjiが空では登録できない' do
      @user.family_name_kanji = '' 
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kanji can't be blank")
    end
    # 済
    it 'family_name_kanjiの値が適切でない' do
      @user.family_name_kanji = 'aaa' 
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kanji is invalid")
    end
    # 済
    it 'personal_name_kanjiが空では登録できない' do
      @user.personal_name_kanji = '' 
      @user.valid?
      expect(@user.errors.full_messages).to include("Personal name kanji can't be blank")
    end
    # 済
    it 'personal_name_kanjiの値が適切でない' do
      @user.personal_name_kanji = 'aaa' 
      @user.valid?
      expect(@user.errors.full_messages).to include("Personal name kanji is invalid")
    end
    # 済
    it 'family_name_kanaが空では登録できない' do
      @user.family_name_kana = '' 
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana can't be blank")
    end
    # 済
    it 'family_name_kanaの値が適切でない' do
      @user.family_name_kana = 'あああ' 
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana is invalid")
    end
    # 済
    it 'personal_name_kanaが空では登録できない' do
      @user.personal_name_kana = '' 
      @user.valid?
      expect(@user.errors.full_messages).to include("Personal name kana can't be blank")
    end
    # 済
    it 'personal_name_kanaの値が適切でない' do
      @user.personal_name_kana = 'あああ' 
      @user.valid?
      expect(@user.errors.full_messages).to include("Personal name kana is invalid")
    end
    # 済
    it 'birthdateが空では登録できない' do
      @user.birthdate = '' 
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthdate can't be blank")
    end
  end
end
