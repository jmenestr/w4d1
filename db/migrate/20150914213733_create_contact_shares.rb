class CreateContactShares < ActiveRecord::Migration
  def change
    create_table :contact_shares do |t|
      t.integer :contact_id, null: false, index: true
      t.integer :user_id, null: false, index: true

      t.timestamps null: false
    end

    add_index :contact_shares, [:contact_id, :user_id], unique: true
  end
end
