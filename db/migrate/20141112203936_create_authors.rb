class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.string :name
      t.string :surname
      t.string :email
      t.string :academic_degree

      t.timestamps
    end
  end
end
