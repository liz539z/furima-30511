require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end
    describe 'ユーザー新規登録' do
      context 'ユーザー登録がうまく行くとき' do
        it "nickname email,password,possword_confirmation,first_name,last_name,first_name_kana,last_name_kana,birthdayが存在すれば登録できること" do
          expect(@user).to be_valid
        end

        it "emailに＠とドメインを含む必要がある" do
          @user.email.match(/@.+/)
          
          expect(@user).to be_valid
        end

        it "passwordが６文字以上であれば登録できること" do
          @user.password.match(/\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i)
          expect(@user).to be_valid
        end

        it "passwordが英数字どちらもあれば登録できること" do
          @user.password.match(/\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i)
          expect(@user).to be_valid
        end
      end


      context '新規登録がうまくいかないとき' do


        it "emailに＠がないとき登録できないこと" do
          @user.email = @user.email.gsub(/@/,'')
          @user.valid?
          expect(@user.errors.full_messages).to include("Email is invalid")

        end

        it "重複したemailが存在する場合登録できないこと" do
          @user.save
          another_user = FactoryBot.build(:user, email:@user.email)
          another_user.valid?
          expect(another_user.errors.full_messages).to include("Email has already been taken", "Email has already been taken")
        end

        it "passwordとpassword_confirmationが不一致では登録できないこと" do
          @user.password = "a12345"
          @user.password_confirmation = "a123456"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end
  
        it "passwordが英語のみまたは数字のみであれば登録できないこと" do
          @user.password = "123456" || "abcdef"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end
        it "passwordが５文字以下であれば登録できないこと" do
          @user.password = "a1234"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password is too short (minimum is 6 characters)")
        end
        it "birthdayが空では登録できないこと" do
          @user.birthday = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Birthday can't be blank")
        end


        it "nicknameが空では登録できないこと" do
          @user.nickname = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Nickname can't be blank")
        end

        it "emailが空では登録できないこと" do
          @user.email = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end

        it "passwordが空では登録できないこと" do
          @user.password = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank", "Password Password Include both letters and numbers", "Password confirmation doesn't match Password")
        end

        it "password_confirmationが空では登録できないこと" do
          @user.password_confirmation = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
        end

        it "first_nameが空では登録できないこと" do
          @user.first_name = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("First name can't be blank", "First name First name Full-width characters")
        end

        it "last_nameが空では登録できないこと" do
          @user.last_name = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name can't be blank", "Last name Last name Full-width characters")
        end
        it "first_name_kanaが空では登録できないこと" do
          @user.first_name_kana = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("First name kana can't be blank", "First name kana First name kana Full-width katakana characters")
        end
        it "last_name_kanaが空では登録できないこと" do
          @user.last_name_kana = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name kana can't be blank", "Last name kana Last name kana Full-width katakana characters")
        end

        it "first_nameが全角文字ではない場合登録できない"do
        @user.first_name = "numata"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name First name Full-width characters")
        end

        it "last_nameが全角文字ではない場合登録できない"do
        @user.last_name = "taro"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name Last name Full-width characters")
        end

        it "first_name_kanaがカタカナではない場合登録できない"do
        @user.first_name_kana = "沼田"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana First name kana Full-width katakana characters")
        end

        it "last_name_kanaがカタカナではない場合登録できない"do
        @user.last_name_kana = "太郎"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana Last name kana Full-width katakana characters")
        end

      end
    end
  end
end
