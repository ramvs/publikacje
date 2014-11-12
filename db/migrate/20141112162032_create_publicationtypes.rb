class CreatePublicationtypes < ActiveRecord::Migration
  def change
    create_table :publicationtypes do |t|
      t.string :name
      t.integer :atributelist_id

      t.timestamps
    end
  end
end
