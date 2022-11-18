class ChangeColumnsInPhotos < ActiveRecord::Migration[7.0]
  def change
    remove_column :photos, :width, :integer
    add_column :photos, :born, :string
    remove_column :photos, :height, :integer
    add_column :photos, :description, :string
  end
end
