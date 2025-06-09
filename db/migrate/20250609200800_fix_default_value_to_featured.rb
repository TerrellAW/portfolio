class FixDefaultValueToFeatured < ActiveRecord::Migration[8.0]
  def up
      change_column_default :projects, :is_featured, false
  end

  def down
      change_column_default :projects, :is_featured, true
  end
end
