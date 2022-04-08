class AddCategoriesType < ActiveRecord::Migration[7.0]
  def change
    add_column :categories, :categoryType, :string

  end
end
