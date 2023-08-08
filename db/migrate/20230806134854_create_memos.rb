class CreateMemos < ActiveRecord::Migration[6.0]
  def change
    create_table :memos do |t|

      t.timestamps
      t.string :text,                 null: false
      t.string :family_code,          null: false
      t.boolean :completed,           default: false
      t.references :user,             null: false , foreign_key: true
    end
  end
end
