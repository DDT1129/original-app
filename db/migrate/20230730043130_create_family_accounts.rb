class CreateFamilyAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :family_accounts do |t|

      t.timestamps

      t.string :family_code,          null: false  
      t.references :user,             null: false , foreign_key: true
    end

    #家族が同じアカウントに入るためにため一意性を除去
    add_index :family_accounts, :family_code,       unique: false
  end
end
