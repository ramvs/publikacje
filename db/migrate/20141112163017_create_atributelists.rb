class CreateAtributelists < ActiveRecord::Migration
  def change
    create_table :atributelists do |t|
      t.integer :publicationtype_id
      t.integer :atribute_id

      t.timestamps
    end
  end
end
