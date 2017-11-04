class FavoritesController < ApplicationController

  def create
    favorite = current_user.favorites.create(clone_id: params[:clone_id])
    redirect_to clones_path,notice: "#{favorite.clone.user.name}さんのブログをお気に入りにしました"
  end

  def  destroy
    favorite = current_user.favorites.find_by(clone_id: params[:clone_id]).destroy
    redirect_to clones_path,notice: "#{favorite.clone.user.name}さんのブログをお気に入りを解除しました"
  end
end
