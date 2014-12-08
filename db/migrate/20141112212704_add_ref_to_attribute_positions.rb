class AddRefToAttributePositions < ActiveRecord::Migration
  def change
    add_reference :attribute_positions, :publication_attribute
    add_reference :attribute_positions, :publication_type
  end
end
