class ClonesController < ApplicationController
  before_action :set_clone, only: [:show,:edit,:update,:destroy]
  
  def index
    @clones = Clone.all
  end
  
  def new
    @clone = Clone.new
  end
  
  def show
  end
  
  def edit
  end
  
  def update
    if @clone.update(clone_params)
      redirect_to clones_path, notice:"ツイートを編集しました"
    else
      render 'edit'
    end
  end
  
  def create
    @clone = Clone.new(clone_params)
    if @clone.save
      redirect_to clones_path, notice:"ツイートしました！"
    else
      render 'new'
    end
  end
  
  def destroy
    @clone.destroy
    redirect_to clones_path, notice:"ツイートを削除しました"
  end

  
  def set_clone
    @clone = Clone.find(params[:id])
  end
  
  private
  def clone_params
    params.require(:clone).permit(:contents)
  end
end
