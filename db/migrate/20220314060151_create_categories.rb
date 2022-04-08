class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.string :type
      t.text :descrption

      t.timestamps
    end
  end
end
