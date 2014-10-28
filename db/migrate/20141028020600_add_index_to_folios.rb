class AddIndexToFolios < ActiveRecord::Migration
  def change
    add_index :folios, [:user_id, :created_at]
  end
end
