class AddFavColumnToShared < ActiveRecord::Migration
  def change
    add_column :contact_shares, :favorite, :boolean
  end
end
