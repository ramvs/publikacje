class CreateAutorlists < ActiveRecord::Migration
  def change
    create_table :autorlists do |t|
      t.boolean :main_autor
      t.integer :autor_id
      t.integer :publication_id

      t.timestamps
    end
  end
end
