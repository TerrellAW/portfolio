class AddDefaultValueToFeatured < ActiveRecord::Migration[8.0]
  def up
      change_column_default :projects, :is_featured, true
  end

  def down
      change_column_default :projects, :is_featured, nil
  end
end
