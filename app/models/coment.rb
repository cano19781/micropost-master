class Coment < ActiveRecord::Base
  belongs_to :trouble
  attr_accessible :body, :commenter
end
