class AddReferencesToPublications < ActiveRecord::Migration
  def change
    add_reference :publications, :user, index: true
    add_reference :publications, :publication_subtype, index: true
  end
end
