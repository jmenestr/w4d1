class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :commentable_id, index: true, null: false
      t.text :comment, null: false
      t.string :commentable_type, null: false

      t.timestamps
    end
  end
end
