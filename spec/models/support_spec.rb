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
        expect(@support.errors.full_messages).to include("User must exist")
      end
      it "requestが紐づいていないと登録できないこと" do
        @support.request = nil
        @support.valid?
        expect(@support.errors.full_messages).to include("Request must exist")
      end
      it "priceが空では登録できないこと" do
        @support.price = nil
        @support.valid?
        expect(@support.errors.full_messages).to include("Price can't be blank")
      end
      it "tokenが空では登録できないこと" do
        @support.token = nil
        @support.valid?
        expect(@support.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
