class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def index
    @users = User.paginate(page: params[:page], per_page: 10)
  end

  def show; end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      reset_session
      log_in @user
      flash[:success] = "You have signed up successfully."
      redirect_to @user
    else
      render 'new', status: :unprocessable_entity
    end
  end

  private

    def set_user
      @user = User.find(params[:id])

      unless current_user == @user
        flash[:alert] = "You are not authorized to view this user"
        redirect_to login_path
      end

      rescue ActiveRecord::RecordNotFound
        flash[:alert] = "The user can not be found."
       redirect_to users_path
      end
    

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
