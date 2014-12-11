class Publication < ActiveRecord::Base
	include PublicActivity::Model

	after_create :remove_reminder

  	tracked except: :destroy, owner: Proc.new{ |controller, model| controller.current_user }
	has_many :attribute_values , inverse_of: :publication , :dependent => :destroy
	has_many :author_positions , inverse_of: :publication , :dependent => :destroy
	has_many :authors , through: :author_positions
	belongs_to :publication_subtype
	belongs_to :user
	validates :title, :description, :user, :publication_subtype, presence: true
	has_attached_file :zalacznik , :url  => "/assets/publications/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/publications/:id/:style/:basename.:extension"
    validates_attachment_content_type :zalacznik, :with => %r{\.(docx|doc|pdf)$}i ,
      :content_type => [ "application/pdf","application/vnd.ms-excel",     
             "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
             "application/msword", 
             "application/vnd.openxmlformats-officedocument.wordprocessingml.document", 
             "text/plain" ]

	accepts_nested_attributes_for :author_positions
	accepts_nested_attributes_for :attribute_values

	

	searchable do
		text :title
		text :description
		integer :user_id 
		integer :author_ids, multiple: true do
			authors.map {|author| author.id }
		end

		text :authors do
			authors.map {|author| author.full_name}
		end
		text :type do
			publication_subtype.full_name
		end
		time :created_at
	end

	def self.form_attributes
		publication_subtype.publication_type.publication_attributes
	end

	def biblio_authors
		string = ""
		authors.each do |a|
			string+=a.biblio_name+" "
		end
		return string
	end

	def set_values arguments
		attributes = []
		publication_subtype.get_attributes.each do |attr|
			val = arguments["#{attr.id}"] unless arguments == nil
			raise "Error. Missing argument for #{attr.name} attribute" if val == nil
			value = AttributeValue.new(publication_attribute: attr, 
			attribute_value: val, publication: self)
			attributes << value
		end if publication_subtype
		attribute_values = []
		self.attribute_values = attributes
	end

	def attrs_values subtype_id
		if publication_subtype.id == subtype_id
      		arry = {}
      		attribute_values.each do |f|
      			arry[f.publication_attribute.id]=f.attribute_value
      		end
      		return arry
    	else
      		return []
    	end
	end

	private 
		def remove_reminder
			self.user.update_attributes(reminder: false)
		end
	
end
