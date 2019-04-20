class BeansController < ApplicationController
  before_action :set_bean, only: %i[show edit update destroy]
  def index
    @beans = Bean.all
  end

  def new
    @bean = Bean.new
  end

  def create
    @bean = current_user.beans.build(bean_params)
    if @bean.save
      redirect_to beans_path, notice: '登録に成功しました。'
    else
      render :new
    end
  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy
  end

  private

  def set_bean
    @bean = Bean.find(params[:id])
  end

  def bean_params
    params.require(:bean).permit(:name, :country, :plantation, :roasted, :grind, :icon, :store, :price, :purchase_date, :description)
  end
end
