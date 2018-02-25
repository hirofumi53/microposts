class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  def index
    @favorites = Favorite.find(params[:id])
    @users = User.all.page(params[:page])
    @favoritings = self.favorites.microposts
  end
  
  def show
    @favorites = self.favorites.order('created_at DESC').page(params[:page])
    @user = User.find(params[:id])
    @micropost = Micropost.find(params[:id])
  end
  
  def create
    micropost = Micropost.find(params[:favorite_id])
    # user = User.find(params[:id])
    current_user.add_favorite(micropost)
    flash[:success] = 'Micropostをお気に入りに追加しました'
    redirect_back(fallback_location: root_path)
  end

  def destroy
    micropost = Micropost.find(params[:favorite_id])
    # user = User.find(params[:id])
    current_user.unfavorite(micropost)
    flash[:success] = 'Micropostをお気に入りから外しました'
    redirect_back(fallback_location: root_path)
  end

end
