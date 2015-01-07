class AddPublishDateToPublications < ActiveRecord::Migration
  def change
    add_column :publications, :publish_at, :date
  end
end
