class Ticket < ActiveRecord::Base
belongs_to :user
  attr_accessible :client_id, :problem, :status, :user_id, :image
belongs_to :client
  
  

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/assets/movies.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
