class PublicationType < ActiveRecord::Base
	has_many :publication_subtypes , :inverse_of=> :publication_type, :dependent => :destroy
	has_many :attribute_positions , inverse_of: :publication_type, :dependent => :destroy
	has_many :publication_attributes, through: :attribute_positions
	accepts_nested_attributes_for :attribute_positions
	validates :name , presence: true , uniqueness: true
	
	def self.getId name
		p = PublicationType.where(name: name).first
		if p == nil
			d = PublicationType.new(name: name)
			d.save
			return d.id
		else
			return p.id
		end
	end


	def self.prepare_type_list
		types = PublicationType.all.order("name ASC")
		ary = Array.new
		types.each do |t|
			t.publication_subtypes.each do |s|
				ary<<["#{t.name} - #{s.name}",s.id]
			end
		end
		return ary
	end
end
