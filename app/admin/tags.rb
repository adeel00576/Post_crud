ActiveAdmin.register Tag do

  permit_params :name
  index do
    selectable_column
    id_column
    column :name
    column :created_at

    actions
  end

  form do |f|
    f.inputs do
      input :name
      f.actions
    end
  end

  controller do
    def create
      name = tag_params.dig(:name)
      @tag = Tag.new(name: [name])
      if @tag.save!
        redirect_to admin_tags_path
      end
    end

    private

    def tag_params
      params.require(:tag).permit(:name)
    end
  end

end


