class RemoveTypeDescrptionFromCategory < ActiveRecord::Migration[7.0]
  def change
    remove_column :categories, :type, :string
    remove_column :categories, :descrption, :string

  end
end
