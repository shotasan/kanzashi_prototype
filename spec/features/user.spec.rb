require 'rails_helper'

RSpec.describe "ユーザー管理機能", type: :feature do
  let(:user_a) { FactoryBot.build(:user, name: "ユーザーA", password: "password")}

  describe "ユーザーの新規登録のテスト" do
    before do
      visit new_user_registration_path
    end

    context "登録に成功する場合" do
      before do
        fill_in "ユーザー名", with: user_a.name
        fill_in "メールアドレス", with: user_a.email
        fill_in "パスワード", with: user_a.password
        fill_in "パスワード確認", with: user_a.password
        click_on "Sign up"
      end

      it "正常に登録し、一覧画面が表示される" do
        expect(page).to have_content "ユーザーAのページ"
      end
    end

    context "登録に失敗する場合" do
      before do
        user_a.save
      end

      it "登録ずみのメールアドレスを使用すると警告が表示される" do
        fill_in "メールアドレス", with: user_a.email
        click_on "Sign up"
        expect(page).to have_selector ".alert-warning"
      end
  #
      it "名前だけ入力すると警告が表示される" do
        fill_in "ユーザー名", with: user_a.name
        click_on "Sign up"
        expect(page).to have_selector ".alert-warning"
      end

      it "メールアドレスだけ入力すると警告が表示される" do
        fill_in "メールアドレス", with: user_a.email
        click_on "Sign up"
        expect(page).to have_selector ".alert-warning"
      end

      it "パスワードだけ入力すると警告が表示される" do
        fill_in "パスワード", with: user_a.password
        click_on "Sign up"
        expect(page).to have_selector ".alert-warning"
      end

      it "パズワード確認だけ入力すると警告が表示される" do
        fill_in "パスワード確認", with: user_a.password
        click_on "Sign up"
        expect(page).to have_selector ".alert-warning"
      end
    end
  end

  describe "ユーザのログインのテスト" do
    before do
      user_a.save
      visit root_path
    end

    context "ログインに成功する場合" do
      before do
        fill_in "メールアドレス", with: user_a.email
        fill_in "パスワード", with: user_a.password
        click_on "Log in"
      end

      it "正常にログインし、マイページが表示される" do
        expect(page).to have_content "ユーザーAのページ"
      end
    end

    context "ログインに失敗する場合" do
      it "メールアドレスだけ入力すると警告が表示される" do
        fill_in "メールアドレス", with: user_a.email
        click_on "Log in"
        expect(page).to have_selector ".alert-danger"
      end

      it "パスワードだけ入力すると警告が表示される" do
        fill_in "パスワード", with: user_a.password
        click_on "Log in"
        expect(page).to have_selector ".alert-danger"
      end

      it "誤ったメールアドレスを入力すると警告が表示される" do
        fill_in "メールアドレス", with: "test@test.com"
        fill_in "パスワード", with: user_a.password
        click_on "Log in"
        expect(page).to have_selector ".alert-danger"
      end

      it "誤ったパスワードを入力すると警告が表示される" do
        fill_in "メールアドレス", with: user_a.email
        fill_in "パスワード", with: "test"
        click_on "Log in"
        expect(page).to have_selector ".alert-danger"
      end
    end
  end

  describe "マイページのテスト" do
    before do
      @user_a = FactoryBot.build(:user, name: "ユーザーA")
      @user_a.save
      @bean_a = @user_a.beans.build(name: "豆A", price: 1_000, purchase_date: Date.today)
      @bean_a.save
      @taste_a = @bean_a.build_taste(impression: "tasteA", bitter: 1, acidity: 1, rich: 1, sweet: 1, aroma: 1)
      @taste_a.save

      @bean_b = @user_a.beans.build(name: "豆B", price: 1_000, purchase_date: Date.today)
      @bean_b.save
      @taste_b = @bean_b.build_taste(impression: "tasteB", bitter: 1, acidity: 1, rich: 1, sweet: 1, aroma: 1)
      @taste_b.save

      @bean_c = @user_a.beans.build(name: "豆C", price: 1_000, purchase_date: Date.today)
      @bean_c.save
      @taste_c = @bean_c.build_taste(impression: "tasteC", bitter: 1, acidity: 1, rich: 1, sweet: 1, aroma: 1)
      @taste_c.save

      visit root_path
      fill_in "メールアドレス", with: @user_a.email
      fill_in "パスワード", with: @user_a.password
      click_on "Log in"
    end

    it "ユーザーAが登録した豆が表示される" do
      expect(page).to have_content "豆A"
    end

    it "ユーザー編集ボタンをクリックするとユーザー編集画面に遷移する" do
      click_on "ユーザー編集"
      expect(page).to have_content "ユーザー情報編集"
    end

    it "一覧に表示されている豆の名称をクリックすると豆の詳細画面に遷移する" do
      click_on "豆A"
      expect(page).to have_content "豆Aの詳細"
    end

    it "一覧に表示されている豆の投稿者をクリックすると投稿者の詳細画面に遷移する" do
      click_on "ユーザーA", match: :first
      expect(page).to have_content "ユーザーAのページ"
    end
  end
end