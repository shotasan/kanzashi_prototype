require 'rails_helper'

RSpec.describe "ストレートコーヒー投稿機能", type: :feature do

  user_a = User.create(name: "ユーザーA", email: "a@example.com", password: "password")
  bean_a = user_a.beans.create(name: "豆A", price: 1_000)
  bean_a.create_taste(impression: "tasteA", bitter: 1, acidity: 1, rich: 1, sweet: 1, aroma: 1)

  before do
    visit root_path
    fill_in "メールアドレス", with: user_a.email
    fill_in "パスワード", with: user_a.password
    click_on "Log in"
  end

  describe "一覧画面のテスト" do
    context "ユーザーAがログインしているとき" do

      it "登録が最新の投稿が先に表示される(作成日時の降順）" do
        visit beans_path
        save_and_open_page
        within ".article" do
          beans_name = all(".article").map(&:text)
          expect(beans_name).to eq %w(豆C 豆B 豆A)
        end
      end
    end
  end
end