class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def index
    @book = Book.new
    @books = Book.all

  end

  def show
     @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])

  end

  def create
    @books = Book.all
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "投稿に成功しました。"
      redirect_to book_path(@book.id)
    else
      # flash.nowでフラッシュメッセージを定義する
      flash.now[:notice] = "投稿に失敗しました。"
       render :index
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:alert] = "投稿更新しました。"
      redirect_to book_path(@book.id)
    else


      flash[:alert] = "更新失敗しました。"
       render :edit
    end

  end

  def destroy
    book = Book.find(params[:id])  # データ（レコード）を1件取得
    book.destroy  # データ（レコード）を削除
    flash[:notice] = "投稿を削除しました。"
    redirect_to '/books'  # 投稿一覧画面へリダイレクト
  end

private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end

end