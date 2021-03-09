class Task < ApplicationRecord

	belongs_to :project
	belongs_to :section
	belongs_to :list
	belongs_to :developer, class_name: 'User', foreign_key: 'user_id'
	belongs_to :owner		 , class_name: 'User', foreign_key: 'user_id'

	has_many :notifications, as: :object
	has_many :comments		 , as: :object

end
