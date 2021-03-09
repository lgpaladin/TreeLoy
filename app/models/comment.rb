class Comment < ApplicationRecord
  
  belongs_to :task
  belongs_to :autor, class_name: 'User', foreign_key: 'user_id'

  has_many 	 :notifications, as: :object
  
end
