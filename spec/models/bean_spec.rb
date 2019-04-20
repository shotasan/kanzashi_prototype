require 'rails_helper'

RSpec.describe Bean, type: :model do
  let!(:first_bean){ FactoryBot.create(:bean) }

  context "バリデーションのテスト" do

    it "nameが無ければ無効な状態であること" do
      first_bean.name = nil
      expect(first_bean.valid?).to be false
    end

    it "nameが30文字以内なら有効な状態であること" do
      first_bean.name = "a" * 30
      expect(first_bean.valid?).to be true
    end

    it "nameが30文字より多いなら無効な状態であること" do
      first_bean.name = "a" * 31
      expect(first_bean.valid?).to be false
    end

    it "descriptionが1000文字以内なら有効な状態であること" do
      first_bean.description = "a" * 1000
      expect(first_bean.valid?).to be true
    end

    it "descriptionが1000文字より多いなら無効な状態であること" do
      first_bean.description = "a" * 1001
      expect(first_bean.valid?).to be false
    end
  end
end
