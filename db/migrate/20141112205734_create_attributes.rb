class CreateAttributes < ActiveRecord::Migration
  def change
    create_table :publication_attributes do |t|
      t.string :name
      t.string :type

      t.timestamps
    end
  end
end
