class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]

  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.create(blog_params)
    @blog.user_id = current_user.id
    if @blog.save
      redirect_to blogs_path, notice:"ブログを作成しました。"
    else
      render :new
    end
  end

  def show
  end

  def edit
    if user_signed_in?
    else redirect_to tops_path, notice:"権限がありません。"
    end
  end

  def update
    if @blog.update(blog_params)
      redirect_to blogs_path, notice:"ブログを編集しました。"
    else
      render :edit
    end
  end

  def destroy
    @blog.destroy
    redirect_to blogs_path, notice:"ブログを削除しました。"
  end


  private

  def set_blog
    @blog = Blog.find(params[:id])
  end

  def blog_params
    params.require(:blog).permit(:title, :content, :picture, :picture_cache, :user_id )
  end

end
