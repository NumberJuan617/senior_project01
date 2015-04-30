class BooksController < ApplicationController
	def new
		@book = Book.new
	end

	def create
		@book = Book.new(book_params)
		if @book.save
			redirect_to manageProfileContent_path
			flash[:success] = "Book added"

		else
			#error validation
			render manageProfileContent_path
			flash[:error] = "Failed to add Book"
		end
	end


	def destroy
		if !(params[:id].nil?) #if what we are going to delete is not nil or null
			@book = Book.find(params[:id])
			@book.destroy
			redirect_to manageProfileContent_path
			flash[:success] = "Book deleted"
		else
			flash[:error] = "Failed to remove book"
		end	
	end

private

	def book_params
		params.require(:book).permit(:name)
	end



end
