class BooksController < ApplicationController
  def index
    #indexアクションの中で新規投稿画面を表示する変数を定義する
    #view(form_withの引数)へ渡すためのインスタンス変数に空のモデルオブジェクト(Book.new)を生成する
    @books = Book.all
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book.id), notice:'Book was successfully created.'
    else
      @books = Book.all
      render :index
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    if book.update(book_params)
      redirect_to book_path(book.id), notice:'Book was successfully updated.'
    else
      @book = book
      render action: :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    if book.destroy
      redirect_to books_path, notice:'Book was successfully destroyed.'
    end
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
