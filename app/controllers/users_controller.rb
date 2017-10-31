class UsersController < ApplicationController
  before_action :logged_in_user, only: [:new,:edit,:show]
  def new
    @user = User.new
  end
  
  def show
    @user=  User.find(params[:id])
    
  end
  
  def create
     @user = User.new(user_params)
     if @user.save
       redirect_to user_path(@user.id),notice:'ログインしました！'
     else
       render 'new'
     end
  end
  
  def logged_in_user
    unless logged_in?
      flash[:danger] = "ログインしてください"
      redirect_to new_session_path
    end
  end
      
  private
   def user_params
     params.require(:user).permit(:name,:email,:password,:password_confirmation)
   end
  
end
