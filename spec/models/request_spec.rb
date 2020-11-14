require 'rails_helper'

RSpec.describe Request, type: :model do
  before do
    @request = FactoryBot.build(:request)
  end

  describe '依頼投稿機能' do
    context '依頼を投稿できる時' do
      it "title, category_id, content, url, job, want, period, reword, prefecture_id, city, people, donationがあれば投稿ができる" do
        expect(@request).to be_valid
      end
      it "urlが空でも投稿できる" do
        @request.url = ""
        expect(@request).to be_valid
      end
    end
  
    context '依頼が投稿できない時' do
      it "userが紐づいていないと投稿できない" do
        @request.user = nil
        @request.valid?
        expect(@request.errors.full_messages).to include("User must exist")
      end
      it "titleが空だと投稿できない" do
        @request.title = ""
        @request.valid?
        expect(@request.errors.full_messages).to include("Title can't be blank")
      end
      it "titleが11文字以上だと登録できない" do
        @request.title = "いろはにほへとちりぬる"
        @request.valid?
        expect(@request.errors.full_messages).to include("Title is too long (maximum is 10 characters)")
      end
      it "imageが空だと投稿できない" do
        @request.image = nil
        @request.valid?
        expect(@request.errors.full_messages).to include("Image can't be blank")
      end
      it "categoryが選択されていないと投稿できない" do
        @request.category_id = 1
        @request.valid?
        expect(@request.errors.full_messages).to include("Category must be other than 1")
      end
      it "contentが空だと投稿できない" do
        @request.content = ""
        @request.valid?
        expect(@request.errors.full_messages).to include("Content can't be blank")
      end
      it "jobが空だと投稿できない" do
        @request.job = ""
        @request.valid?
        expect(@request.errors.full_messages).to include("Job can't be blank")
      end
      it "wantが空だと投稿できない" do
        @request.want = ""
        @request.valid?
        expect(@request.errors.full_messages).to include("Want can't be blank")
      end
      it "periodが空だと投稿できない" do
        @request.period = ""
        @request.valid?
        expect(@request.errors.full_messages).to include("Period can't be blank")
      end
      it "rewardが空だと投稿できない" do
        @request.reword = ""
        @request.valid?
        expect(@request.errors.full_messages).to include("Reword can't be blank")
      end
      it "prefectureが選択されていないと投稿できない" do
        @request.prefecture_id = 0
        @request.valid?
        expect(@request.errors.full_messages).to include("Prefecture must be other than 0")
      end
      it "cityが空だと投稿できない" do
        @request.city = ""
        @request.valid?
        expect(@request.errors.full_messages).to include("City can't be blank")
      end
      it "peopleが空だと投稿できない" do
        @request.people = ""
        @request.valid?
        expect(@request.errors.full_messages).to include("People can't be blank", "People is not a number")
      end
      it "peopleに数字以外が入力あれていると投稿できない" do
        @request.people = "あア阿a"
        @request.valid?
        expect(@request.errors.full_messages).to include("People is not a number")
      end
      it "peopleに1000以上の数値が入力されていると投稿できない" do
        @request.people = 1000
        @request.valid?
        expect(@request.errors.full_messages).to include("People must be less than or equal to 999")
      end
      it "donationが空だと投稿できない" do
        @request.donation = ""
        @request.valid?
        expect(@request.errors.full_messages).to include("Donation can't be blank", "Donation is not a number")
      end
      it "donationに数字以外が入力あれていると投稿できない" do
        @request.donation = "あア阿a"
        @request.valid?
        expect(@request.errors.full_messages).to include("Donation is not a number")
      end
      it "donationに10000000以上の数値が入力されていると投稿できない" do
        @request.donation = 10000000
        @request.valid?
        expect(@request.errors.full_messages).to include("Donation must be less than or equal to 9999999")
      end
    end
  end
end
