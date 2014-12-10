class AddInfoToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :info ,  :string
  end
end
