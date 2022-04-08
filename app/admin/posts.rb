ActiveAdmin.register Post do

   permit_params :title, :description
   
   index do
      selectable_column
      id_column
      column :title
      column :description
      actions
    end
  
    form do |f|
      f.inputs do
        input :title
        input :description
        f.actions
      end
    end
  
    controller do
      def create
        @post = Post.new(post_params)
        if @post.save!
          redirect_to admin_post_path
        end
      end
  
      private
  
      def post_params
        params.require(:post).permit(:title, :description)
      end
    end
 
  
end
