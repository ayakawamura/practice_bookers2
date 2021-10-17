class BooksController < ApplicationController
  
  before_action :ensure_correct_user,only:[:edit,:update,:destroy]
  
  def create
    book = Book.new(book_params)
    book.user_id = current_user.id
    book.save
    redirect_to book_path(book.id)
  end
  
  def index
    @user = current_user
    @book = Book.new
    @books = Book.all
  end
  
  def show
    @user = current_user
    @newbook = Book.new
    @book = Book.find(params[:id])
  end
  
  def edit
    @book =Book.find(params[:id])
  end
  
  def update
    @book =Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book)
    else
      render :edit
    end
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end
  
  
  private
  def book_params
    params.require(:book).permit(:title,:body)
  end
  
  def ensure_correct_user
    @book = Book.find(params[:id])
    unless @book.user == current_user
      redirect_to books_path
    end
  end
    
  
end
