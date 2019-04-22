require 'rails_helper'

RSpec.describe Taste, type: :model do
  let(:test_bean){ FactoryBot.create(:bean) }
  let(:test_taste){ test_bean.create_taste(impression: "MyText", bitter: 1, acidity: 1, rich: 1, sweet: 1, aroma: 1) }

  context "バリデーションのテスト" do

    it "impressionが無ければ無効な状態であること" do
      test_taste.impression = ""
      expect(test_taste.valid?).to be false
    end

    it "impressionが1000文字以内なら有効な状態であること" do
      test_taste.impression = "a" * 1000
      expect(test_taste.valid?).to be true
    end

    it "impressionが1000文字より多いなら無効な状態であること" do
      test_taste.impression = "a" * 1001
      expect(test_taste.valid?).to be false
    end

    it "bitterが無ければ無効な状態であること" do
      test_taste.bitter = ""
      expect(test_bean.valid?).to be false
    end

    it "acidityが無ければ無効な状態であること" do
      test_taste.acidity = ""
      expect(test_bean.valid?).to be false
    end

    it "richが無ければ無効な状態であること" do
      test_taste.rich = ""
      expect(test_bean.valid?).to be false
    end

    it "sweetが無ければ無効な状態であること" do
      test_taste.sweet = ""
      expect(test_bean.valid?).to be false
    end

    it "aromaが無ければ無効な情であること" do
      test_taste.aroma = ""
      expect(test_bean.valid?).to be false
    end
  end
end