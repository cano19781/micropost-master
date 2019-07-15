class Comen < ActiveRecord::Base
  belongs_to :movie
  attr_accessible :body, :commenter
end
