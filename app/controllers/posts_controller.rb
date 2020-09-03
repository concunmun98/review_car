class PostsController < ApplicationController

   before_action :find_post, only: [:show] 

  def index
    @posts = Post.all
  end  
  def new
    @post = Post.new
  end  
  def create
  	current_user = User.first
  
    @post = current_user.posts.build(post_params)
 
    if @post.save!
      flash[:success] = "Post Created!"
      redirect_to root_url
    else
      @posts = Post.all.paginate(page: params[:page])
      render :new
    end
  end
  def show
  
  end 

  def destroy
    @post.destroy
    flash[:success] = "post deleted"
    redirect_to request.referrer || root_url
  end

  private
  def post_params
    params.require(:post).permit(:content, :image)
  end

  def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
  end

  def find_post
      @post = Post.find_by id:params[:id] 
      if  @post.nil?
        redirect_to root_path
      end
   end 
end

  def require_admin
    unless current_user.admin?
      redirect_to root_path
    end
end