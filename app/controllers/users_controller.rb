class UsersController < ApplicationController
 before_action :is_matching_login_user

  def index
    @users = User.all
    @user = User.new
    @book = Book.new
    @user = current_user
  end


  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end


  def edit
    @user = User.find(params[:id])
     if current_user.id != @user.id
       redirect_to user_path(current_user)
     end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name,:introduction, :profile_image)
  end

   def is_matching_login_user
     unless user_signed_in?
     redirect_to new_user_session_path
     end
   end

end
