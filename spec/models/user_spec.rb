require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    # 正規表現
    context '新規登録できるとき' do
      it '全ての項目が入力されていれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      # 1 済
      it 'nick_nameが空では登録できない' do
        @user.nick_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nick name can't be blank")
      end
      # 2 済
      it 'メールアドレスが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      # 3 済 ※２人目を作成する必要あり！
      it '重複したメールアドレスは登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      # 4 済
      it 'メールアドレスに@を含まない場合は登録できない' do
        @user.email = 'aaabbb'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      # 5 済
      it 'パスワードが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      # 6 済
      it 'パスワードが6文字未満では登録できない' do
        @user.password_confirmation = '1111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      # 7 済
      it '英字のみのパスワードでは登録できない' do
        @user.password = 'eeeeee'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      # 8 済
      it '数字のみのパスワードでは登録できない' do
        @user.password = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      # 9 済
      it '全角文字を含むパスワードでは登録できない' do
        @user.password = 'あ111111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      # 10 済
      it 'パスワードとパスワード（確認用）が不一致だと登録できない' do
        @user.password_confirmation = '000000bb'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      # 11 済
      it '姓（全角）が空だと登録できない' do
        @user.family_name_kanji = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kanji can't be blank")
      end
      # 12 済
      it '姓（全角）に半角文字が含まれていると登録できない' do
        @user.family_name_kanji = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name kanji is invalid')
      end
      # 13 済
      it '名（全角）が空だと登録できない' do
        @user.personal_name_kanji = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Personal name kanji can't be blank")
      end
      # 14 済
      it '名（全角）に半角文字が含まれていると登録できない' do
        @user.personal_name_kanji = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Personal name kanji is invalid')
      end
      # 15 済
      it '姓（カナ）が空だと登録できない' do
        @user.family_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana can't be blank")
      end
      # 16 済
      it '姓（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
        @user.family_name_kana = 'あああ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name kana is invalid')
      end
      # 17 済
      it '名（カナ）が空だと登録できない' do
        @user.personal_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Personal name kana can't be blank")
      end
      # 18 済
      it '名（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
        @user.personal_name_kana = 'あああ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Personal name kana is invalid')
      end
      # 19 済
      it '生年月日が空だと登録できない' do
        @user.birthdate = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthdate can't be blank")
      end
    end
  end
end
