class ChangeColumnName < ActiveRecord::Migration
  def change
  	rename_column :atributelists, :atribute_id, :atribut_id
  end
end
