class CreateSituations < ActiveRecord::Migration[6.0]
  def change
    create_table :situations do |t|

      t.timestamps

      #t.boolean :out,                 null: false, default: false
      t.string  :purpose
      t.integer :genre_id,            null: false
      t.references :user,             null: false , foreign_key: true
      t.string :family_code,          null: false
    end
  end
end
