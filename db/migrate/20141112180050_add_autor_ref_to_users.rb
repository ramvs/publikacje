class AddAutorRefToUsers < ActiveRecord::Migration
  def change
  	add_reference :users , :autor , index: true
  end
end
