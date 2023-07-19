class CreateSituations < ActiveRecord::Migration[6.0]
  def change
    create_table :situations do |t|

      t.timestamps

      
      t.string  :purpose
      t.integer :genre_id,            null: false

    end
  end
end
