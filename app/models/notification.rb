class Notification < ApplicationRecord
  
  belongs_to :target, class_name: 'User'
  belongs_to :task
  belongs_to :object, polymorphic :true

end