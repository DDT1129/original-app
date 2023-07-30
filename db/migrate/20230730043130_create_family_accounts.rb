class CreateFamilyAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :family_accounts do |t|

      t.timestamps
    end
  end
end
