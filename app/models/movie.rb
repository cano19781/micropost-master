class Movie < ActiveRecord::Base
 

  attr_accessible :cast, :director, :duration, :genre, :production, :rating, :sinop, :title, :user_id, :year, :image

  belongs_to :user

has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/assets/movies.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/


end
