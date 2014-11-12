class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :autor, :autosave => true , :inverse_of => :user , :dependent => :destroy
  accepts_nested_attributes_for :autor

  validates :autor , presence: true
end
