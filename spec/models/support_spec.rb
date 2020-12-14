require 'rails_helper'

RSpec.describe Support, type: :model do
  before do
    @support = FactoryBot.build(:support)
  end

  describe '資金援助機能' do
    context '資金援助ができる時' do
      it "priceとtokenがあれば保存ができること" do
        expect(@support).to be_valid
      end
    end
  
    context '資金援助ができない時' do
      it "userが紐づいていないと登録できないこと" do
        @support.user = nil
        @support.valid?
        expect(@support.errors.full_messages).to include("Userを入力してください")
      end
      it "requestが紐づいていないと登録できないこと" do
        @support.request = nil
        @support.valid?
        expect(@support.errors.full_messages).to include("Requestを入力してください")
      end
      it "priceが空では登録できないこと" do
        @support.price = nil
        @support.valid?
        expect(@support.errors.full_messages).to include("支援金額を入力してください", "支援金額は数字で入力してください")
      end
      it "priceが数値以外の場合は登録できないこと" do
        @support.price = "あア阿a"
        @support.valid?
        expect(@support.errors.full_messages).to include("支援金額は数字で入力してください")
      end
      it "tokenが空では登録できないこと" do
        @support.token = nil
        @support.valid?
        expect(@support.errors.full_messages).to include("クレジットカード番号等を入力してください")
      end
    end
  end
end
