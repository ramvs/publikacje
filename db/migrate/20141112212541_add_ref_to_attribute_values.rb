class AddRefToAttributeValues < ActiveRecord::Migration
  def change
    add_reference :attribute_values, :publication
    add_reference :attribute_values, :publication_attribute
  end
end
