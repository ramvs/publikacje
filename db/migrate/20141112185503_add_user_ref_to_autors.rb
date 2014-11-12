class AddUserRefToAutors < ActiveRecord::Migration
  def change
  	remove_reference :users , :autor
  	add_reference  :autors , :user , index: true
  end
end
