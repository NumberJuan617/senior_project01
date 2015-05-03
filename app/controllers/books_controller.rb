class BooksController < ApplicationController
	def new
		if logged_in?
			@book = Book.new
		else
			redirect_to root_url
		end
	end

	def create
		@book = Book.new(book_params)
		if @book.save
			redirect_to manageProfileContent_path
			flash[:success] = "Book added"

		else
			#error validation
			redirect_to addNewBook_path
			flash[:danger] = "Failed to add new Book because it already exists or the entry was empty!"
		end
	end


	def destroy
		if !(params[:id].nil?) #if what we are going to delete is not nil or null
			@book = Book.find(params[:id])
			@book.destroy
			redirect_to manageProfileContent_path
			flash[:success] = "Book deleted"
		else
			flash[:danger] = "Failed to remove book"
		end	
	end

private

	def book_params
		params.require(:book).permit(:name)
	end



end
