class Task < ApplicationRecord

	belongs_to :project
	belongs_to :section, optional: true
	belongs_to :list
	belongs_to :developer, class_name: 'User', optional: true
	belongs_to :owner		 , class_name: 'User'

	has_many :notifications, as: :object
	has_many :comments		 , as: :object

end
