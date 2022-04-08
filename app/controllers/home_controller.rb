class HomeController < ApplicationController
  before_action :authenticate_user!


  def new
    if params[:search].blank?
      @posts = Post.all
      @user = User.all
    else
      @user = User.all
      @posts = Post.where('title LIKE ?', "%#{params[:search]}%")
      if @posts.nil?
        @posts = Post.all
      end

    end
  end
  
  private

  def admin_only
    unless current_user.admin?
      redirect_to :back, :alert => "Access denied."
    end
  end
end
