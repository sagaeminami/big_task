class ClonesController < ApplicationController
  before_action :set_clone, only: [:show,:edit,:update,:destroy]
  before_action :logged_in_user, only: [:new,:edit,:show]

  def index
    @clones = Clone.all
  end

  def new
    @clone = Clone.new
  end

  def show
    @favorite = current_user.favorites.find_by(clone_id: @clone.id)
  end

  def edit
  end

  def confirm
    @clone = Clone.new(clone_params) # <=POSTされたパラメータを取得
  end


  def update
    if @clone.update(clone_params)
      redirect_to clones_path, notice:"ツイートを編集しました"
    else
      render 'edit'
    end
  end

  def create
    @clone = current_user.clones.new(clone_params)
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

  def favorite
    @favorite_clones = current_user.favorite_clones
  end


  def set_clone
    @clone = Clone.find(params[:id])
  end

  def logged_in_user
    unless logged_in?
      flash[:danger] = "ログインしてください"
      redirect_to new_session_path
    end
  end


  private
  def clone_params
    params.require(:clone).permit(:contents)
  end
end
