class Trouble < ActiveRecord::Base
	has_many :coments, dependent: :destroy

	belongs_to :client
	belongs_to :user
  attr_accessible :category, :client_id, :severity, :state, :text, :title, :user_id, :image

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/assets/movies.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/


end
