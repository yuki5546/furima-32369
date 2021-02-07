require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context 'ユーザ新規登録ができる時' do
      it 'nickname、email、password、password_confirmation、last_name、first_name、last_name_kana、first_name_kana、user_birth_dateが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it '重複したemailが存在しなければ登録できる' do
        @user.save
        another_user = FactoryBot.build(:user)
        expect(another_user).to be_valid
      end
      it 'emailに@が存在すれば登録できる' do
        @user.email = 'testtest@test.co.jp'
        expect(@user).to be_valid
      end
      it 'passwordが6文字以上で、半角英数字の両方が存在し、passwordとpassword_confirmationの値が同じ場合であれば登録できる' do
        @user.password = 'abc123'
        @user.password_confirmation = 'abc123'
        expect(@user).to be_valid
      end
      it 'last_nameに全角（漢字・ひらがな・カタカナ）が存在する場合登録できる' do
        @user.last_name = '阿あア'
        @user.valid?
        expect(@user).to be_valid
      end
      it 'first_nameに全角（漢字・ひらがな・カタカナ）が存在する場合登録できる' do
        @user.first_name = '阿あア'
        @user.valid?
        expect(@user).to be_valid
      end
      it 'last_name_kanaに全角（カタカナ）が存在する場合登録できる' do
        @user.last_name_kana = 'アイウ'
        @user.valid?
        expect(@user).to be_valid
      end
      it 'first_name_kanaに全角（カタカナ）が存在する場合登録できる' do
        @user.first_name_kana = 'アイウ'
        @user.valid?
        expect(@user).to be_valid
      end
    end

    context 'ユーザ新規登録ができない時' do
      it 'nicknameが空では登録できない' do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailに@が存在しない場合登録できない' do
        @user.email = 'testtest.co.jp'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordに半角英数字の両方が存在しない場合登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
        @user.password = 'abcdef'
        @user.password_confirmation = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
        @user.password = '１２３ＡＢＣ'
        @user.password_confirmation = '１２３ＡＢＣ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordとpassword_confirmationの値が異なる場合は登録できない' do
        @user.password_confirmation = 'abc123'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'last_nameに全角（漢字・ひらがな・カタカナ）が存在しない場合登録できない' do
        @user.last_name = 'aAｱ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name Full-width characters')
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'first_nameに全角（漢字・ひらがな・カタカナ）が存在しない場合登録できない' do
        @user.first_name = 'aAｱ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name Full-width characters')
      end
      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it 'last_name_kanaに全角（カタカナ）が存在しない場合登録できない' do
        @user.last_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana Full-width katakana characters')
      end
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it 'first_name_kanaに全角（カタカナ）が存在しない場合登録できない' do
        @user.first_name_kana = 'あ阿'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana Full-width katakana characters')
      end
      it 'user_birth_dateが空では登録できない' do
        @user.user_birth_date = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("User birth date can't be blank")
      end
    end
  end
end
