class MyBlendsController < ApplicationController
  before_action :set_blend, only: %i[show edit update destroy]

  def index
    @blends = MyBlend.all
  end

  def new
    @blend = MyBlend.new
    @blend.build_taste
  end

  def create
    @blend = current_user.my_blends.build(blend_params)
    if @blend.save
      redirect_to my_blends_path, notice: "#{@blend.name}の登録に成功しました。"
    else
      render :new
    end
  end

  def edit ;end

  def show ;end

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
    @blend = MyBlend.find(params[:id])
  end

  def blend_params
    params.require(:my_blend).permit(:name, :choice1, :choice2, :choice3, :amount1, :amount2, :amount3, :description,
                                    taste_attributes: [:bitter, :acidity, :rich, :sweet, :aroma, :impression])
  end
end
