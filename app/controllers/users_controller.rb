class UsersController < ApplicationController

	def index
		@users = User.all
		@user = User.new
		@books = Book.all
		@book = Book.new
	end

	def show
		@user = User.find(params[:id])
		@books = @user.books.page(params[:page]).reverse_order
		@book = Book.new
	end

	def edit
		@user = User.find(params[:id])
		if @user != current_user
			redirect_to user_path(current_user)
		end
	end

	def update
  	    @user = User.find(params[:id])
        if @user.update(user_params)
        redirect_to user_path(@user.id)
        flash[:complete] = "You have updated user successfully."
        else
    	render 'edit'
        end
	end

	
	private
    def user_params
      params.require(:user).permit(:name, :profile_image, :introduction)
    end
end
