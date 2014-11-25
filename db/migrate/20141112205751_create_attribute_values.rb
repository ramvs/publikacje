class CreateAttributeValues < ActiveRecord::Migration
  def change
    create_table :attribute_values do |t|
      t.string :attribute_value

      t.timestamps
    end
  end
end
