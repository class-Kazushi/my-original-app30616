require 'rails_helper'

RSpec.describe Apply, type: :model do
  before do
    @apply = FactoryBot.build(:apply)
  end

  describe '依頼への応募機能' do
    context '応募ができる時' do
      it "phone_num, reason, questionがあれば応募できる" do
        expect(@apply).to be_valid
      end
      it "reasonがあればphone_numとquestionがなくても応募できる" do
        @apply.phone_num = ""
        @apply.question = ""
        expect(@apply).to be_valid
      end
    end
  
    context '応募ができない時' do
      it "userが紐づいていないと登録できないこと" do
        @apply.user = nil
        @apply.valid?
        expect(@apply.errors.full_messages).to include("User must exist")
      end
      it "requestが紐づいていないと登録できないこと" do
        @apply.request = nil
        @apply.valid?
        expect(@apply.errors.full_messages).to include("Request must exist")
      end
      it "phone_numに電話番号以外の文字が入力されていると応募できない" do
        @apply.phone_num = "あア阿abcdef"
        @apply.valid?
        expect(@apply.errors.full_messages).to include("Phone num is invalid")
      end
      it "reasonが空だと応募できない" do
        @apply.reason = ""
        @apply.valid?
        expect(@apply.errors.full_messages).to include("Reason can't be blank")
      end
    end
  end
end