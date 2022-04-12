class PostsController < ApplicationController
  # before_action :authenticate_user!
    
    def new
        @post = Post.new
        @category = Category.all
        render json { render json: {all_data: {post: @post, category: @category}}}
    end

    def create
        @post = current_user.posts.new(post_params)
        if @post.save
          # redirect_to home_path, notice: 'Product was successfully created.'
          render json: @post
        else
          render :new
        end
        
    end

    def edit
      @post = Post.find(params[:id])
      @tags = @post.tags
      render json { render json: {all_data: {post: @post, tags: @tags}}}
    end

    def update
      @post = Post.find(params[:id])
      if @post.update(post_params)
        redirect_to home_path, notice: 'Post was successfully updated.'
      else
        render :edit
      end
      render json: @post
    end

    def destroy
      @post = Post.find(params[:id])
      @post.destroy
      redirect_to home_path, notice: 'Product was successfully deleted.'
      render json: @post
    end

    def show
      @post = Post.find(params[:id])
      puts @post.title
      render json: @post
    end

    def index
      puts "index"
    end

    def like
      post = Post.find(params[:id])
      like = post.likes.create(user_id: current_user.id)
      puts like
      like.save
      redirect_to home_path(post), notice: 'You liked the Post.'
      render json { render json: {all_data: {post: post, like: like}}}
    end
  
    def unlike
      current_user.likes.find_by(post_id: params[:id])&.destroy
      redirect_to home_path(@post), notice: 'You unliked the Post.'
    end

    private

    def post_params
      params.require(:post).permit(:title, :description, :category, :tag_list, { tag_ids: [] })
    end

   
end
