class CreatePublications < ActiveRecord::Migration
  def change
    create_table :publications do |t|
      t.timestamp :add_date
      t.text :attention
      t.string :title
      t.timestamp :create_date
      t.integer :publicationsubtype_id

      t.timestamps
    end
  end
end
