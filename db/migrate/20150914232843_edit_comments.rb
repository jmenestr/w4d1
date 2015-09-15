class EditComments < ActiveRecord::Migration
  def change
    add_column :comments, :author_id, :integer, index: true
  end
end
