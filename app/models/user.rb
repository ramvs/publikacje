class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :author, :autosave => true , :inverse_of => :user , :dependent => :destroy
  has_many :publications 

  accepts_nested_attributes_for :author

  validates :author , presence: true

  def full_name
  	author.full_name
  end

  def active_for_authentication? 
    super && approved? 
  end 

  def inactive_message 
    if !approved? 
      :not_approved 
    else 
      super # Use whatever other message 
    end 
  end

end
