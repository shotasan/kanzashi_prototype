require 'rails_helper'

RSpec.describe Bean, type: :model do
  let(:first_bean){ FactoryBot.build(:bean) }
  describe '新規登録のテスト' do

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

      it "countryが30文字以内なら有効な状態であること" do
        first_bean.country = "a" * 30
        expect(first_bean.valid?).to be true
      end

      it "plantationが30文字より多いなら無効な状態であること" do
        first_bean.plantation = "a" * 31
        expect(first_bean.valid?).to be false
      end

      it "plantationが30文字以内なら有効な状態であること" do
        first_bean.plantation = "a" * 30
        expect(first_bean.valid?).to be true
      end

      it "roastedが30文字以内なら有効な状態であること" do
        first_bean.roasted = "a" * 30
        expect(first_bean.valid?).to be true
      end

      it "roastedが30文字より多いなら無効な状態であること" do
        first_bean.roasted = "a" * 31
        expect(first_bean.valid?).to be false
      end

      it "grindが30文字以内なら有効な状態であること" do
        first_bean.grind = "a" * 30
        expect(first_bean.valid?).to be true
      end

      it "grindが30文字より多いなら無効な状態であること" do
        first_bean.grind = "a" * 31
        expect(first_bean.valid?).to be false
      end

      it "storeが30文字以内なら有効な状態であること" do
        first_bean.store = "a" * 30
        expect(first_bean.valid?).to be true
      end

      it "storeが30文字より多いなら無効な状態であること" do
        first_bean.store = "a" * 31
        expect(first_bean.valid?).to be false
      end

      it "countryが30文字より多いなら無効な状態であること" do
        first_bean.country = "a" * 31
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
end
