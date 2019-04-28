class BeansController < ApplicationController
  before_action :set_bean, only: %i[edit update destroy]

  def index
    @q = Bean.ransack(params[:q])
    @beans = @q.result(distinct: true).page(params[:page]).includes(:user, :taste)
  end

  def new
    @bean = Bean.new
    @bean.build_taste
  end

  def create
    @bean = current_user.beans.build(bean_params)

    if params[:back].present?
      render :new
      return
    end

    if @bean.save
      redirect_to beans_path, notice: "#{@bean.name}の登録に成功しました。"
    else
      render :new
    end
  end

  def confirm_new
    @bean = current_user.beans.build(bean_params)
    render :new unless @bean.valid?
  end

  def edit ;end

  def show
    @bean = Bean.find(params[:id])
    @favorites = current_user.favorite_beans.find_by(bean_id: @bean)
  end

  def update
    if @bean.update(bean_params)
      redirect_to beans_path, notice: "#{@bean.name}の編集に成功しました。"
    else
      render :edit
    end
  end

  def destroy
    @bean.destroy
    redirect_to beans_path, notice: "#{@bean.name}の削除に成功しました。"
  end

  private

  def set_bean
    @bean = current_user.beans.find(params[:id])
  end

  def bean_params
    params.require(:bean).permit(:name, :country, :plantation, :roasted, :grind, :icon, :store, :price, :purchase_date, :description,
                                 taste_attributes: [:bitter, :acidity, :rich, :sweet, :aroma, :impression])
  end
end
