require 'rails_helper'

RSpec.describe "ストレートコーヒー投稿機能", type: :feature do
  before do
    @user_a = FactoryBot.build(:user, name: "ユーザーA")
    @user_a.save

    @bean = @user_a.beans.create(name: "豆A", price: 1_000, purchase_date: Date.today)
    @bean.create_taste(impression: "tasteA", bitter: 1, acidity: 1, rich: 1, sweet: 1, aroma: 1)

    @my_blend_a = @user_a.my_blends.build(name: "豆A", choice1: @bean.id, choice2: @bean.id, amount1: 10, amount2: 10, description: "Test")
    @my_blend_a.save
    @taste_a = @my_blend_a.build_taste(impression: "tasteA", bitter: 1, acidity: 1, rich: 1, sweet: 1, aroma: 1)
    @taste_a.save

    @my_blend_b = @user_a.my_blends.build(name: "豆B", choice1: @bean.id, choice2: @bean.id, amount1: 10, amount2: 10, description: "Test")
    @my_blend_b.save
    @taste_b = @my_blend_b.build_taste(impression: "tasteB", bitter: 1, acidity: 1, rich: 1, sweet: 1, aroma: 1)
    @taste_b.save

    @my_blend_c = @user_a.my_blends.build(name: "豆C", choice1: @bean.id, choice2: @bean.id, amount1: 10, amount2: 10, description: "Test")
    @my_blend_c.save
    @taste_c = @my_blend_c.build_taste(impression: "tasteC", bitter: 1, acidity: 1, rich: 1, sweet: 1, aroma: 1)
    @taste_c.save

    visit root_path
    fill_in "メールアドレス", with: @user_a.email
    fill_in "パスワード", with: @user_a.password
    click_on "Log in"
    visit my_blends_path
  end

  describe "一覧画面のテスト" do
    it "登録が最新の投稿が先に表示される(作成日時の降順）" do
      within ".article" do
        my_blends_name = all(".bean-name").map(&:text)
        expect(my_blends_name).to eq %w(豆C 豆B 豆A)
      end
    end

    it "新規登録ボタンをクリックすると新規登録画面に遷移する" do
      click_on "新規登録"
      expect(page).to have_content "新規登録"
    end

    it "一覧に表示されているブレンドの名称をクリックするとブレンドの詳細画面に遷移する" do
      click_on "豆A"
      expect(page).to have_content "豆Aの詳細"
    end

    it "一覧に表示されているブレンドの投稿者をクリックすると投稿者の詳細画面に遷移する" do
      click_on "ユーザーA", match: :first
      expect(page).to have_content "ユーザーAのページ"
    end

    it "名称で検索欄に検索したい名称を入力し、検索ボタンを押すと検索したい名称を含まないものは表示されない" do
      fill_in "名称で検索", with: "C"
      click_on "検索"
      expect(page).not_to have_content "豆A"
    end
  end

  describe "新規登録のテスト" do
    before do
      visit new_my_blend_path
      fill_in "名称", with: "Test"
      select @bean.name, from: "豆１"
      fill_in "量", with: 10, match: :first
      select @bean.name, from: "豆２"
      within ".second-amount" do
        fill_in "量", with: 20
      end
      fill_in "詳細", with: "this is test"
      fill_in "総評", with: "THIS IS TEST"
    end

    context "正常に入力してした場合" do
      it "確認画面に遷移する" do
        click_on "登録する"
        expect(page).to have_content "以下の内容で登録しますか？"
      end

      it "確認画面で登録するをクリックすると登録される" do
        click_on "登録する"
        click_on "登録する"
        expect(page).to have_selector ".alert-success"
      end
    end

    context "不正な値を入力していた場合" do
      it "名称を空欄で登録するを押すとエラーメッセージが表示される" do
        fill_in "名称", with: ""
        click_on "登録する"
        expect(page).to have_selector ".alert-warning"
      end

      it "豆１を空欄で登録するを押すとエラーメッセージが表示される" do
        select "", from: "豆１"
        click_on "登録する"
        expect(page).to have_selector ".alert-warning"
      end

      it "豆１の量を空欄で登録するを押すとエラーメッセージが表示される" do
        fill_in "量", with: "", match: :first
        click_on "登録する"
        expect(page).to have_selector ".alert-warning"
      end

      it "豆２を空欄で登録するを押すとエラーメッセージが表示される" do
        select "", from: "豆２"
        click_on "登録する"
        expect(page).to have_selector ".alert-warning"
      end

      it "豆２の量を空欄で登録するを押すとエラーメッセージが表示される" do
        within ".second-amount" do
          fill_in "量", with: ""
        end
        click_on "登録する"
        expect(page).to have_selector ".alert-warning"
      end

      it "詳細を空欄で登録するを押すとエラーメッセージが表示される" do
        fill_in "詳細", with: ""
        click_on "登録する"
        expect(page).to have_selector ".alert-warning"
      end

      it "総評を空欄で登録するを押すとエラーメッセージが表示される" do
        fill_in "総評", with: ""
        click_on "登録する"
        expect(page).to have_selector ".alert-warning"
      end
    end
  end

  describe  "詳細画面のテスト" do
    before do
      visit my_blend_path(@my_blend_a)
    end

    it "お気に入りするをクリックするとお気に入り登録される" do
      click_on "お気に入りする"
      expect(page).to have_content "お気に入りしました"
    end

    it "お気に入り解除するをクリックするとお気に入りが解除される" do
      click_on "お気に入りする"
      click_on "お気に入り解除する"
      expect(page).to have_content "お気に入りを解除しました"
    end

    it "編集ボタンをクリックすると編集画面に遷移する" do
      click_on "編集"
      expect(page).to have_content "編集"
    end
  end

  describe "編集画面のテスト" do
    before do
      visit edit_my_blend_path(@my_blend_a)
    end

    context "正常に入力してした場合" do
      it "登録が完了し、一覧画面に遷移する" do
        click_on "更新する"
        expect(page).to have_content "ストレートコーヒー"
        expect(page).to have_selector ".alert-success"
      end
    end

    context "不正な値を入力していた場合" do
      it "名称を空欄で更新するを押すとエラーメッセージが表示される" do
        fill_in "名称", with: ""
        click_on "更新する"
        expect(page).to have_selector ".alert-warning"
      end

      it "豆１を空欄で更新するを押すとエラーメッセージが表示される" do
        select "", from: "豆１"
        click_on "更新する"
        expect(page).to have_selector ".alert-warning"
      end

      it "豆１の量を空欄で更新するを押すとエラーメッセージが表示される" do
        fill_in "量", with: "", match: :first
        click_on "更新する"
        expect(page).to have_selector ".alert-warning"
      end

      it "豆２を空欄で更新するを押すとエラーメッセージが表示される" do
        select "", from: "豆２"
        click_on "更新する"
        expect(page).to have_selector ".alert-warning"
      end

      it "豆２の量を空欄で更新するを押すとエラーメッセージが表示される" do
        within ".second-amount" do
          fill_in "量", with: ""
        end
        click_on "更新する"
        expect(page).to have_selector ".alert-warning"
      end

      it "詳細を空欄で更新するを押すとエラーメッセージが表示される" do
        fill_in "詳細", with: ""
        click_on "更新する"
        expect(page).to have_selector ".alert-warning"
      end

      it "総評を空欄で更新するを押すとエラーメッセージが表示される" do
        fill_in "総評", with: ""
        click_on "更新する"
        expect(page).to have_selector ".alert-warning"
      end
    end
  end
end