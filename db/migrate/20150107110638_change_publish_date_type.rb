class ChangePublishDateType < ActiveRecord::Migration
  def change
  	remove_column :publications, :publish_at
  	add_column :publications, :publish_at, :integer
  end
end
