class CreateJoinTableProjectsTags < ActiveRecord::Migration[8.0]
  def change
    create_join_table :projects, :tags do |t|
      # t.index [:project_id, :tag_id]
      # t.index [:tag_id, :project_id]
    end
  end
end
