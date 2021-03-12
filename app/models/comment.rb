class Comment < ApplicationRecord
  
  belongs_to :task
  belongs_to :autor, class_name: 'User'

  has_many 	 :notifications, as: :object
  
end
