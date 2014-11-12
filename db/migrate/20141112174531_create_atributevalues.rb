class CreateAtributevalues < ActiveRecord::Migration
  def change
    create_table :atributevalues do |t|
      t.string :wartosc
      t.integer :atribute_id
      t.integer :publication_id

      t.timestamps
    end
  end
end
