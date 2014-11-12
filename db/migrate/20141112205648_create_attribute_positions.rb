class CreateAttributePositions < ActiveRecord::Migration
  def change
    create_table :attribute_positions do |t|
      t.boolean :required

      t.timestamps
    end
  end
end
