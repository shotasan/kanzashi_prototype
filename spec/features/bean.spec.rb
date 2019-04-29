require 'rails_helper'

RSpec.describe "ストレートコーヒー投稿機能", type: :feature do

  let(:user_a) { FactoryBot.create(:user, name: "ユーザーA")}
  let(:bean_a) { FactoryBot.catate(:bean, name: "豆A")}
  let(:bean_b) { FactoryBot.catate(:bean, name: "豆B")}
  let(:bean_c) { FactoryBot.catate(:bean, name: "豆C")}


  before do
    visit root_path
    fill_in "メールアドレス", with: login_user.email
    fill_in "パスワード", with: login_user.password
    click_on "Log in"
  end

  describe "一覧画面のテスト" do
    context "ユーザーAがログインしているとき" do
      let(:login_user){ user_a }

      it "登録が最新の投稿が先に表示される(作成日時の降順）" do
        visit beans_path
        save_and_open_page
        within ".table-body" do
          task_titles = all(".task-title").map(&:text)
          expect(task_titles).to eq %w(Aの3番目のタスク Aの2番目のタスク Aの最初のタスク)
        end
      end
    end
  end
end