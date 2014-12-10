class AddAddedByRefToAuthors < ActiveRecord::Migration
  def change
  	add_column :authors , :added_by_id , :integer
  end
end
