class BooksController < ApplicationController
  def index
    #indexアクションの中で新規投稿画面を表示する変数を定義する
    #view(form_withの引数)へ渡すためのインスタンス変数に空のモデルオブジェクト(Book.new)を生成する
    @books = Book.all
    @book = Book.new
  end

  def create
    book = Book.new(book_params)
    book.save
    redirect_to '/'
  end

  def show
    @book = Book.find(params[:id])
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
