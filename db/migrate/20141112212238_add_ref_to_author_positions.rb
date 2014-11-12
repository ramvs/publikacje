class AddRefToAuthorPositions < ActiveRecord::Migration
  def change
    add_reference :author_positions, :publication
    add_reference :author_positions, :author
  end
end
