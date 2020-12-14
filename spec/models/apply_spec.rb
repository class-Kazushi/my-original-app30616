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
      it "userが紐づいていないと応募できないこと" do
        @apply.user = nil
        @apply.valid?
        expect(@apply.errors.full_messages).to include("Userを入力してください")
      end
      it "requestが紐づいていないと応募できないこと" do
        @apply.request = nil
        @apply.valid?
        expect(@apply.errors.full_messages).to include("Requestを入力してください")
      end
      it "phone_numに電話番号以外の文字が入力されていると応募できない" do
        @apply.phone_num = "あア阿abcdef"
        @apply.valid?
        expect(@apply.errors.full_messages).to include("電話番号は数字で入力してください")
      end
      it "reasonが空だと応募できない" do
        @apply.reason = ""
        @apply.valid?
        expect(@apply.errors.full_messages).to include("応募理由・動機を入力してください")
      end
    end
  end
end