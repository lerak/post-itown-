class PostsController < ApplicationController
	before_action :find_post , only:[:show,:edit,:update,:vote]
  before_action :require_user, only: [:new,:create,:edit]


  def index
  	@posts = Post.all.sort_by{|x| x.total_votes}.reverse
  end

  def show
    @comment = Comment.new
  end 

  def new 
  	@post = Post.new
  end 

  def create 
    @post = Post.new(post_params)
    @post.creator = current_user
    if @post.save 
    	flash[:notice] = 'Your post was created succesfully'
    	redirect_to post_path(@post)
    else
       render :new 
    end
  end

  def edit; end 

 

  def update 
  	if @post.update(post_params)
  	flash[:notice] = 'Post was updated succesfully'
  	redirect_to post_path(@post)
   else
    render :edit
   end
  end 

  def vote
    vote = Vote.create(voteable: @post,creator: current_user,vote: params[:vote])
    if vote.valid?
      flash[:notice]='Vote Created'
      redirect_to :back
    else

    end

  end

private 

 def find_post
 	@post = Post.find(params[:id])
 end

 def post_params
 	params.require(:post).permit(:title,:description,:url,category_ids:[])

 	end
end
