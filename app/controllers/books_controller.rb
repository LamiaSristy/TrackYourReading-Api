class BooksController < ApplicationController
  before_action :find_user
  before_action :find_book, only: %i[show update destroy]

  def index
    render json: @user.books
    #   @books = Book.all 
    #   render json: @books
  end

  def create
    @book = Book.new(books_params)
    if @book.save
      render json: @book
    else
      render json: { error: 'Unable to add Book' }, status: 400
    end
  end

  def show
    render json: @book
  end

  def update
    if @book
      @book.update(books_params)
      render json: { message: 'Book has been succesfully updated' }, status: 200
    else
      render json: { error: 'Unable to update Book' }, status: 400
    end
  end

  def destroy
    if @book
    @book.destroy
    render json: { message: 'Book succesfully deleted' }, status: 200
    else
      render json: { error: 'Unable to delete Book' }, status: 400
    end
  end

  private

  def books_params
    params.require(:book).permit(:name, :genre, :author, :pages, :user_id, :id)
  end

  def find_user
    @user = User.find(params[:user_id])
  end

  def find_book
    @illness = Book.find(params[:id])
  end
end
