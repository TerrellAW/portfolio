class AddFieldsToProjects < ActiveRecord::Migration[8.0]
  def change
    add_column :projects, :thumbnail_desc, :string
    add_column :projects, :desc, :string
    add_column :projects, :link, :string
    add_column :projects, :img_1_desc, :string
    add_column :projects, :img_2_desc, :string
    add_column :projects, :img_3_desc, :string
  end
end
