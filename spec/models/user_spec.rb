require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user_a){ FactoryBot.build(:user) }
  describe '新規登録のテスト' do

    context 'バリデーションのテスト' do
      it '名前、メールアドレス、パスワードが入力されて入れば有効な状態であること' do
        expect(user_a.save).to be true
      end

      it '名前が無ければ無効な状態であること' do
        user_a.name = ""
        expect(user_a.save).to be false
      end

      it '名前が30文字以内なら有効な状態であること' do
        user_a.name = "a" * 30
        expect(user_a.save).to be true
      end

      it '名前が30文字より多いなら無効な状態であること' do
        user_a.name = "a" * 31
        expect(user_a.save).to be false
      end

      it 'メールアドレスが無ければ無効な状態であること' do
        user_a.email = ""
        expect(user_a.save).to be false
      end

      it 'メールアドレスが合計で255文字以内なら有効な状態であること' do
        user_a.email = "a" * 251 + "@" + "a" + "." + "a"
        expect(user_a.save).to be true
      end

      it 'メールアドレスが合計で255文字より多いなら無効な状態であること' do
        user_a.email = "a" * 252 + "@" + "a" + "." + "a"
        expect(user_a.save).to be false
      end

      it 'メールアドレスに@が含まれていないと無効な状態であること' do
        user_a.email = "a.a"
        expect(user_a.save).to be false
      end

      it 'メールアドレスに.が含まれていないと無効な状態であること' do
        user_a.email = "a@a"
        expect(user_a.save).to be false
      end

      it 'パスワードが無ければ無効な状態であること' do
        user_a.password = ""
        expect(user_a.save).to be false
      end

      it 'パスワードが6文字以上なら有効な状態であること' do
        user_a.password = "a" * 6
        expect(user_a.save).to be true
      end

      it 'パスワードが6文字未満なら無効な状態であること' do
        user_a.password = "a" * 5
        expect(user_a.save).to be false
      end
    end
  end
end