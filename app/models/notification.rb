class Notification < ApplicationRecord
  
  belongs_to :target, class_name: 'User', foreign_key: 'user_id'
  belongs_to :task
  belongs_to :object, polymorphic :true

end