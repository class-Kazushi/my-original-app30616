require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録ができる時' do
      it "nickname, email, passwordとpassword_confirmation, family_name, first_name, family_kana, first_kana, gender_id, age, occupation_id, ability, introductionが存在する場合に登録できる" do
        expect(@user).to be_valid
      end
    end

    context '新規登録ができない時' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空だと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailに@が含まれていないと登録できない' do
        @user.email = 'aaa12345gmail.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが7文字以下では登録できない' do
        @user.password = '1234ab'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 8 characters)')
      end
      it 'passwordが半角数字のみで入力されている場合は登録できない' do
        @user.password = '12345678'
        @user.password_confirmation = '12345678'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordが半角英字のみで入力されている場合は登録できない' do
        @user.password = 'abcdefgh'
        @user.password_confirmation = 'abcdefgh'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'family_nameが空では登録できない' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank", 'Family name is invalid')
      end
      it 'family_nameが全角で入力されていなれば登録できない' do
        @user.family_name = 'abc123'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name is invalid')
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank", 'First name is invalid')
      end
      it 'first_nameが全角で入力されていなれば登録できない' do
        @user.first_name = 'abc123'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid')
      end
      it 'family_kanaが空では登録できない' do
        @user.family_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family kana can't be blank", 'Family kana is invalid')
      end
      it 'family_kanaが全角カナで入力されていなれば登録できない' do
        @user.family_kana = 'ああ阿'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family kana is invalid')
      end
      it 'first_kanaが空では登録できない' do
        @user.first_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First kana can't be blank", 'First kana is invalid')
      end
      it 'first_kanaが全角カナで入力されていなければ登録できない' do
        @user.first_kana = 'ああ阿'
        @user.valid?
        expect(@user.errors.full_messages).to include('First kana is invalid')
      end
      it 'genderが選択されていない場合は登録できない' do
        @user.gender_id = 1
        @user.valid?
        expect(@user.errors.full_messages).to include('Gender must be other than 1')
      end
      it 'ageが空では登録できない' do
        @user.age = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Age can't be blank")
      end
      it 'ageが0では登録できない' do
        @user.age = 0
        @user.valid?
        expect(@user.errors.full_messages).to include("Age must be greater than or equal to 1")
      end
      it 'ageが100以上では登録できない' do
        @user.age = 100
        @user.valid?
        expect(@user.errors.full_messages).to include("Age must be less than or equal to 99")
      end
      it 'occupationが選択されていない場合は登録できない' do
        @user.occupation_id = 1
        @user.valid?
        expect(@user.errors.full_messages).to include('Occupation must be other than 1')
      end
      it 'abilityが空では登録できない' do
        @user.ability = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Ability can't be blank")
      end
      it 'introductionが空では登録できない' do
        @user.introduction = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Introduction can't be blank")
      end
    end
  end
end
