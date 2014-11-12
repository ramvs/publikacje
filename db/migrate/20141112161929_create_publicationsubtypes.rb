class CreatePublicationsubtypes < ActiveRecord::Migration
  def change
    create_table :publicationsubtypes do |t|
      t.string :name
      t.integer :publicationtype_id

      t.timestamps
    end
  end
end
