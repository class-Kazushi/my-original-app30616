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
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end
      it 'emailが空だと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("メールアドレスを入力してください")
      end
      it 'emailに@が含まれていないと登録できない' do
        @user.email = 'aaa12345gmail.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('メールアドレスは不正な値です', 'メールアドレスは半角英数字と@が必要です')
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('メールアドレスはすでに存在します')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it 'passwordが7文字以下では登録できない' do
        @user.password = '1234ab'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは8文字以上で入力してください')
      end
      it 'passwordが半角数字のみで入力されている場合は登録できない' do
        @user.password = '12345678'
        @user.password_confirmation = '12345678'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは半角英数字混合で入力してください')
      end
      it 'passwordが半角英字のみで入力されている場合は登録できない' do
        @user.password = 'abcdefgh'
        @user.password_confirmation = 'abcdefgh'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは半角英数字混合で入力してください')
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it 'family_nameが空では登録できない' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名字を入力してください", '名字は全角ひらがな・カタカナ・漢字で入力してください')
      end
      it 'family_nameが全角で入力されていなれば登録できない' do
        @user.family_name = 'abc123'
        @user.valid?
        expect(@user.errors.full_messages).to include('名字は全角ひらがな・カタカナ・漢字で入力してください')
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名前を入力してください", '名前は全角ひらがな・カタカナ・漢字で入力してください')
      end
      it 'first_nameが全角で入力されていなれば登録できない' do
        @user.first_name = 'abc123'
        @user.valid?
        expect(@user.errors.full_messages).to include('名前は全角ひらがな・カタカナ・漢字で入力してください')
      end
      it 'family_kanaが空では登録できない' do
        @user.family_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("フリガナ（名字）を入力してください", 'フリガナ（名字）は全角カタカナで入力してください')
      end
      it 'family_kanaが全角カナで入力されていなれば登録できない' do
        @user.family_kana = 'ああ阿'
        @user.valid?
        expect(@user.errors.full_messages).to include('フリガナ（名字）は全角カタカナで入力してください')
      end
      it 'first_kanaが空では登録できない' do
        @user.first_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("フリガナ（名前）を入力してください", 'フリガナ（名前）は全角カタカナで入力してください')
      end
      it 'first_kanaが全角カナで入力されていなければ登録できない' do
        @user.first_kana = 'ああ阿'
        @user.valid?
        expect(@user.errors.full_messages).to include('フリガナ（名前）は全角カタカナで入力してください')
      end
      it 'genderが選択されていない場合は登録できない' do
        @user.gender_id = 1
        @user.valid?
        expect(@user.errors.full_messages).to include('性別を選択してください')
      end
      it 'ageが空では登録できない' do
        @user.age = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("ご年齢を入力してください")
      end
      it 'ageが0では登録できない' do
        @user.age = 0
        @user.valid?
        expect(@user.errors.full_messages).to include("ご年齢は1以上の値にしてください")
      end
      it 'ageが100以上では登録できない' do
        @user.age = 100
        @user.valid?
        expect(@user.errors.full_messages).to include("ご年齢は99以下の値にしてください")
      end
      it 'occupationが選択されていない場合は登録できない' do
        @user.occupation_id = 1
        @user.valid?
        expect(@user.errors.full_messages).to include('職業を選択してください')
      end
      it 'abilityが空では登録できない' do
        @user.ability = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("特技や資格・経験などを入力してください")
      end
      it 'introductionが空では登録できない' do
        @user.introduction = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("自己PRを入力してください")
      end
    end
  end
end
