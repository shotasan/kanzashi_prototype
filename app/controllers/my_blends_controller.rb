class MyBlendsController < ApplicationController
  before_action :set_blend, only: %i[edit update destroy]

  def index
    @q = MyBlend.ransack(params[:q])
    @blends = @q.result(distinct: true).page(params[:page]).includes(:user, :taste).order(created_at: :desc)
  end

  def new
    @blend = MyBlend.new
    @blend.build_taste
  end

  def create
    @blend = current_user.my_blends.build(blend_params)

    if params[:back].present?
      render :new
      return
    end

    if @blend.save
      redirect_to my_blends_path, notice: "#{@blend.name}の登録に成功しました。"
    else
      render :new
    end
  end

  def confirm_new
    @blend = current_user.my_blends.build(blend_params)
    render :new unless @blend.valid?
  end

  def edit ;end

  def show
    @blend = MyBlend.find(params[:id])
    @favorites = current_user.favorite_blends.find_by(my_blend_id: @blend)
    @comments = @blend.comments.includes(:user)
    @comment = @blend.comments.build
  end

  def update
    if @blend.update(blend_params)
      redirect_to my_blend_path(@blend), notice: "#{@blend.name}の編集に成功しました。"
    else
      render :edit
    end
  end

  def destroy
    @blend.destroy
    redirect_to my_blends_path, notice: "#{@blend.name}の削除に成功しました。"
  end

  private

  def set_blend
    @blend = current_user.my_blends.find(params[:id])
  end

  def blend_params
    params.require(:my_blend).permit(:name, :choice1, :choice2, :choice3, :amount1, :amount2, :amount3, :description,
                                     taste_attributes: [:bitter, :acidity, :rich, :sweet, :aroma, :impression])
  end
end