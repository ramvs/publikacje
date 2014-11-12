class AddRefToPublicationSubtypes < ActiveRecord::Migration
  def change
    add_reference :publication_subtypes, :publication_type
  end
end
