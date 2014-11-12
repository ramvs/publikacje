class CreateAtributs < ActiveRecord::Migration
  def change
    create_table :atributs do |t|
      t.string :name
      t.string :typ

      t.timestamps
    end
  end
end
