class CreateFamilyAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :family_accounts do |t|

      t.timestamps

      t.string :family_code,          null: false  
      t.references :user,             null: false , foreign_key: true
    end

    add_index :family_accounts, :family_code,       unique: true
  end
end
