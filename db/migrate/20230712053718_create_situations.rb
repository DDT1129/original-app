class CreateSituations < ActiveRecord::Migration[6.0]
  def change
    create_table :situations do |t|

      t.timestamps

      t.string :situation,           null: false
      t.string :purpose,             null: false

    end
  end
end
