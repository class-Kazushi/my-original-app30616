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
        expect(@request.errors.full_messages).to include("Userを入力してください")
      end
      it "titleが空だと投稿できない" do
        @request.title = ""
        @request.valid?
        expect(@request.errors.full_messages).to include("タイトルを入力してください")
      end
      it "titleが11文字以上だと登録できない" do
        @request.title = "いろはにほへとちりぬる"
        @request.valid?
        expect(@request.errors.full_messages).to include("タイトルは10文字以内で入力してください")
      end
      it "imageが空だと投稿できない" do
        @request.image = nil
        @request.valid?
        expect(@request.errors.full_messages).to include("画像を入力してください")
      end
      it "categoryが選択されていないと投稿できない" do
        @request.category_id = 1
        @request.valid?
        expect(@request.errors.full_messages).to include("カテゴリーを選択してください")
      end
      it "contentが空だと投稿できない" do
        @request.content = ""
        @request.valid?
        expect(@request.errors.full_messages).to include("依頼内容を入力してください")
      end
      it "jobが空だと投稿できない" do
        @request.job = ""
        @request.valid?
        expect(@request.errors.full_messages).to include("活動内容を入力してください")
      end
      it "wantが空だと投稿できない" do
        @request.want = ""
        @request.valid?
        expect(@request.errors.full_messages).to include("求める人物を入力してください")
      end
      it "periodが空だと投稿できない" do
        @request.period = ""
        @request.valid?
        expect(@request.errors.full_messages).to include("募集期限を入力してください")
      end
      it "rewardが空だと投稿できない" do
        @request.reword = ""
        @request.valid?
        expect(@request.errors.full_messages).to include("報酬・給与を入力してください")
      end
      it "prefectureが選択されていないと投稿できない" do
        @request.prefecture_id = 0
        @request.valid?
        expect(@request.errors.full_messages).to include("活動地域を選択してください")
      end
      it "cityが空だと投稿できない" do
        @request.city = ""
        @request.valid?
        expect(@request.errors.full_messages).to include("活動場所を入力してください")
      end
      it "peopleが空だと投稿できない" do
        @request.people = ""
        @request.valid?
        expect(@request.errors.full_messages).to include("募集人数を入力してください", "募集人数は数値で入力してください")
      end
      it "peopleに数字以外が入力あれていると投稿できない" do
        @request.people = "あア阿a"
        @request.valid?
        expect(@request.errors.full_messages).to include("募集人数は数値で入力してください")
      end
      it "peopleに1000以上の数値が入力されていると投稿できない" do
        @request.people = 1000
        @request.valid?
        expect(@request.errors.full_messages).to include("募集人数は999以下の値にしてください")
      end
      it "donationが空だと投稿できない" do
        @request.donation = ""
        @request.valid?
        expect(@request.errors.full_messages).to include("募集金額を入力してください", "募集金額は数値で入力してください")
      end
      it "donationに数字以外が入力あれていると投稿できない" do
        @request.donation = "あア阿a"
        @request.valid?
        expect(@request.errors.full_messages).to include("募集金額は数値で入力してください")
      end
      it "donationに10000000以上の数値が入力されていると投稿できない" do
        @request.donation = 10000000
        @request.valid?
        expect(@request.errors.full_messages).to include("募集金額は9999999以下の値にしてください")
      end
    end
  end
end
