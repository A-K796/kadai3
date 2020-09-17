class BooksController < ApplicationController

	def create
		@book = Book.new(book_params)
    	@book.user_id = current_user.id
    	@books = Book.all
		if @book.save
			redirect_to book_path(@book.id)
			flash[:complete] = "book successfully"
		else
			render "index"
		end
	end

	def show
		@book = Book.find(params[:id])
		@book_new = Book.new
		
	end

	def edit
		@book = Book.find(params[:id])
		if @book.user != current_user
			redirect_to books_path
		end
	end

	def update
		@book = Book.find(params[:id])
		@book.update(book_params)
		if @book.save
			redirect_to book_path(@book.id)
			flash[:complete] = "book successfully"
		else
			render "edit"
		end
	end

	def destroy
		@book = Book.find(params[:id])
		@book.destroy
		redirect_to books_path
	end

	def index
		@book = Book.new
		@books = Book.all
	end

	private
    def book_params
      params.require(:book).permit(:title, :body, :user_id)
    end
end
