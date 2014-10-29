class CreateTrails < ActiveRecord::Migration
  def change
    create_table :trails do |t|
      t.string  :name
      t.string  :city
      t.string  :state
      t.text  :description
      t.string  :activity_type_name
      t.text  :directions
      t.string  :trail_length
      t.string  :source_url
      t.integer :folio_id

      t.timestamps
    end
  end
end
