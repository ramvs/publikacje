class CreatePublicationSubtypes < ActiveRecord::Migration
  def change
    create_table :publication_subtypes do |t|
      t.string :name

      t.timestamps
    end
  end
end
