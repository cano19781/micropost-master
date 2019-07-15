class Client < ActiveRecord::Base
belongs_to :user
  attr_accessible :address, :email, :name, :phone, :user_id

  has_many :tickets
  has_many :troubles
end
