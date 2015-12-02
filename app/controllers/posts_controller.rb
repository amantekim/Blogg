class PostsController < ApplicationController
 


  def index
    @posts = Post.all
  end

  def show
  end

  def new 
    @post = Post.new
  end

  def create
    @post = Post.new post_params 
    if @post.save
      flash[:notice] = "New post added"
      redirect_to posts_path
    else
      flash[:alert] = "Failed Posting"
      redirect_to posts_path
    end
  end

  def edit
    @post = Post.find params[:id]
  end

  def update
    @post = Post.find params[:id]
    if @post.update(post_params)
      flash[:notice] = "Post was updated"      
      redirect_to posts_path
      else
      flash[:alert] = "Update failed"      
      redirect_to posts_path
    end
  end

  def destroy
    @post = Post.find params[:id]
    if @post.destroy
      flash[:notice] = "Deleted Post"
      redirect_to posts_path
    else
      flash[:error] = "Error"
      redirect_to posts_path
    end
  end

  private

  def post_params
    params.require(:post).permit(:name, :content)
  end
end

