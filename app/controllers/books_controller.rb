class BooksController < ApplicationController

  def index
    @books = Book.all
  end


  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book)
  end


  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(@book)
  end

  def destroy
    @book = Book.find(params[:id])
    if @book.destroy
    redirect_to books_path, notice: '削除しました'
    end
  end


  private
  def book_params
    params.require(:book).permit(:title,:opinion)
  end


end
