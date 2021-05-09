class UsersController < ApplicationController
 before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
 before_action :correct_user,   only: [:edit, :update]
 before_action :admin_user,     only: [:index, :destroy]

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    binding.pry
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "#{@user.name}さん! ようこそ Original Piano App へ"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def index
    @users = User.paginate(page: params[:page])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = "削除しました"
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end

end
