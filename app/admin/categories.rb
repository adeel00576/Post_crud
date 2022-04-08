ActiveAdmin.register Category do

   index do
    selectable_column
    id_column
   
    #The upper statment always consider AdminUser as resourcecat_Type
    column :categoryType
    column :created_at
    actions
  end

  form do |f|
    f.inputs do
      input :categoryType
      f.actions
    end
  end

  controller do
    def create
      @category = Category.new(category_params)
  
      if @category.save!
        redirect_to admin_categories_path
      end
    end

    private
    def category_params
      params.require(:category).permit(:resourcecat_type, :categoryType)
    end

  end
  
end
