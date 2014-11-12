class CreateAuthorPositions < ActiveRecord::Migration
  def change
    create_table :author_positions do |t|
      t.boolean :main

      t.timestamps
    end
  end
end
