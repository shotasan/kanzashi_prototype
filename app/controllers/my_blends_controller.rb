class MyBlendsController < ApplicationController
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

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def blend_params
    params.require(:my_blend).permit(:name, :choice1, :choice2, :choice3, :amount1, :amount2, :amount3, :description,
                                    taste_attributes: [:bitter, :acidity, :rich, :sweet, :aroma, :impression])
  end
end
