class Task < ApplicationRecord

	belongs_to :project
	belongs_to :section, optional: true
	belongs_to :list
	belongs_to :owner	 , class_name: 'User'

	has_many :notifications, as: :object
	has_many :comments		 , as: :object

	has_and_belongs_to_many :developers, class_name: 'User'

end
