class UsersController < ApplicationController
 def edit
  is_matching_login_user
  @user = User.find(params[:id])
 end

 def index
   @user = current_user
   @book = Book.new
   @users = User.all
 end

 def show
   @user = User.find(params[:id])
   @book = Book.new
   @books = @user.books
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
    params.require(:user).permit(:name, :profile_image, :introduction)
 end

 def is_matching_login_user
   user = User.find(params[:id])
   login_user = current_user
   if(user.id != login_user.id)
    redirect_to user_path(current_user.id)
   end
 end
end
