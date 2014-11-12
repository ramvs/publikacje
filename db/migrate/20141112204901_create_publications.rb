class CreatePublications < ActiveRecord::Migration
  def change
    create_table :publications do |t|
      t.string :title
      t.string :description
      t.datetime :creation_date

      t.timestamps
    end
  end
end
