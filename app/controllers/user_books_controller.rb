class UserBooksController < ApplicationController
	def new
		if logged_in?
			@user = current_user
			@userBook = UserBook.new
			@bookOptions = Book.all.map{|u| [ u.name, u.id] }

			@userBookOptions = Array.new


			@isThere = false;
			@bookOptions.each do |bo|
			if !(@user.user_books.where("book_id ="+bo[1].to_s).exists?)
				@book = Book.find(bo[1])
				@temp = Array.new
				@temp.push(@book.name, @book.id)
				@userBookOptions.push(@temp)
				@isThere = true
				end
			end

			if !(@isThere)
			flash[:danger] = "There are no new books to add"
			redirect_to addNewBook_path
			end
		else
			redirect_to root_url
		end
	end

	def create
		@userBook = UserBook.new(userBook_params)
		if @userBook.save
			redirect_to manageProfileContent_path
			flash[:success] = "Book added"
		else
			render manageProfileContent_path
			flash[:error] = "Failed to add Book"
		end
	end

	def destroy
		if !(params[:id].nil?) #if what we are going to delete is not nil or null
		@userBook = UserBook.find(params[:id])
		@userBook.destroy
		redirect_to manageProfileContent_path
		flash[:success] = "Book deleted"
		else
		redirect_to manageProfileContent_path
		flash[:error] = "Failed to remove Book"
		end
	end

	private

	def userBook_params
		params.require(:user_book).permit(:user_id, :book_id)
	end
end
