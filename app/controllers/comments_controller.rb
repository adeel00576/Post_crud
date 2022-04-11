class CommentsController < ApplicationController

  # before_action :authenticate_user!, except: [:show, :index]
  before_action :set_post, only: [:create, :edit, :update, :destroy, :show]
  before_action :set_comment, only: [:edit, :destroy, :show]


  def index
    @post = Post.find(params[:post_id])
    @comments = @post.comments.all
  end

  def new
    
    @post = Post.find(params[:post_id])
    @comments = @post.comments.new
    
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    # @comment.user_id = current_user.id
    if @comment.save!
      redirect_to post_comments_path
    end
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      redirect_to post_comments_path, notice: 'Comment was successfully updated.'
    else
      render :edit
    end
  end
 

  def edit; end

  def destroy
    @comment.destroy
    redirect_to post_comments_path, notice: 'Comment is successfully destroyed.'
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :user_id)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_comment
    @comment = @post.comments.find(params[:id])
  end
end

