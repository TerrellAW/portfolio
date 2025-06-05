class AddColorToProjects < ActiveRecord::Migration[8.0]
  def change
    add_column :projects, :color, :string
  end
end
