class BeansController < ApplicationController
  before_action :set_bean, only: %i[show edit update destroy]

  def index
    @beans = Bean.all
  end

  def new
    @bean = Bean.new
    @bean.build_taste
  end

  def create
    @bean = current_user.beans.build(bean_params)
    if @bean.save
      redirect_to beans_path, notice: "#{@bean.name}の登録に成功しました。"
    else
      render :new
    end
  end

  def edit ;end

  def show
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
    @bean = Bean.find(params[:id])
  end

  def bean_params
    params.require(:bean).permit(:name, :country, :plantation, :roasted, :grind, :icon, :store, :price, :purchase_date, :description, :user_id,
                                 taste_attributes: [:bitter, :acidity, :rich, :sweet, :aroma, :impression])
  end
end
