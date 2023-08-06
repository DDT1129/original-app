class CreateMemos < ActiveRecord::Migration[6.0]
  def change
    create_table :memos do |t|

      t.timestamps
      t.string :text,           null: false  
      t.references :user,       null: false , foreign_key: true
    end
  end
end
