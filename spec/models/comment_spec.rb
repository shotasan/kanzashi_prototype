require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'バリデーションのテスト' do
    let(:test_comment){ FactoryBot.create(:comment) }

    it 'contentが無ければ無効な状態であること' do
      test_comment.content = ""
      expect(test_comment.valid?).to be false
    end

    it 'contentが1000文字以内なら有効な状態であること' do
      test_comment.content = "a" * 1000
      expect(test_comment.valid?).to be true
    end

    it 'contentが1000文字より多いなら無効な状態であること' do
      test_comment.content = "a" * 1001
      expect(test_comment.valid?).to be false
    end
  end
end
