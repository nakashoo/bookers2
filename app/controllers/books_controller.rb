class BooksController < ApplicationController
before_action :is_matching_login_user
  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @user = current_user

    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book)
    else
      @books = Book.all
      @errors = @book.errors.full_messages
      render :index
    end
  end


  def show
    @book = Book.find(params[:id])
    @user = @book.user

  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book)
    else
     render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    if @book.destroy
    redirect_to books_path
    end
  end


  private
  def book_params
    params.require(:book).permit(:title,:body)
  end

   def is_matching_login_user
     unless user_signed_in?
     redirect_to new_user_session_path
     end
   end

end
