require 'rails_helper'

RSpec.describe MyBlend, type: :model do
  let(:test_blend){ FactoryBot.create(:my_blend) }

  context "バリデーションのテスト" do

    it "nameが無ければ無効な状態であること" do
      test_blend.name = ""
      expect(test_blend.valid?).to be false
    end

    it "nameが30文字以内なら有効な状態であること" do
      test_blend.name = "a" * 30
      expect(test_blend.valid?).to be true
    end

    it "nameが30文字より多いなら無効な状態であること" do
      test_blend.name = "a" * 31
      expect(test_blend.valid?).to be false
    end

    it "choice1が無ければ無効な状態であること" do
      test_blend.choice1 = ""
      expect(test_blend.valid?).to be false
    end

    it "choice2が無ければ無効な状態であること" do
      test_blend.choice2 = ""
      expect(test_blend.valid?).to be false
    end

    it "amount1が無ければ無効な状態であること" do
      test_blend.amount1 = ""
      expect(test_blend.valid?).to be false
    end

    it "amount1に0以下の数値が入ると無効な状態であること" do
      test_blend.amount1 = 0
      expect(test_blend.valid?).to be false
    end

    it "amount1に100より大きい数値が入ると無効な状態であること" do
      test_blend.amount1 = 101
      expect(test_blend.valid?).to be false
    end

    it "amount2に0以下の数値が入ると無効な状態であること" do
      test_blend.amount2 = 0
      expect(test_blend.valid?).to be false
    end

    it "amount2に0以下の数値が入ると無効な状態であること" do
      test_blend.amount2 = 0
      expect(test_blend.valid?).to be false
    end

    it "amount2に100より大きい数値が入ると無効な状態であること" do
      test_blend.amount2 = 101
      expect(test_blend.valid?).to be false
    end

    it "descriptionが1000文字以内なら有効な状態であること" do
      test_blend.description = "a" * 1000
      expect(test_blend.valid?).to be true
    end

    it "descriptionが1000文字より多いなら無効な状態であること" do
      test_blend.description = "a" * 1001
      expect(test_blend.valid?).to be false
    end
  end
end
