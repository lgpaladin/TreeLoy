class List < ApplicationRecord

	belongs_to :project

	has_many   :tasks
	has_many 	 :notifications, as: :object

end
