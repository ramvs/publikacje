class CreateAutors < ActiveRecord::Migration
  def change
    create_table :autors do |t|
      t.string :name
      t.string :surename
      t.string :email
      t.string :academic_degree

      t.timestamps
    end
  end
end
