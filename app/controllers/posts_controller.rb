class PostsController < ApplicationController
  def index
    @post = Post.new
    @delete_form = Post.new
    @q = Post.ransack(params[:q])
    @posts = @q.result(distinct: true)
  end

  def create
    @post = Post.new(create_params)
    @posts = Post.all
    if @post.save
      flash[:notice] = '成功'
      return redirect_to posts_path
    else
      render :index
    end
  end

  def destroy
    post = Post.find(params[:id])
    if post.password == params[:delete_password]
      post.destroy!
      end

      return redirect_to posts_path, flash: {notice: 'パスワードが違います'}
  rescue => e

  end

  private

  def create_params
    params.require(:post).permit(:name, :password, :content)
  end
end
