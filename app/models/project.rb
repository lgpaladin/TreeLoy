class Project < ApplicationRecord

	has_one  :team

	has_many :lists
	has_many :tasks

end
