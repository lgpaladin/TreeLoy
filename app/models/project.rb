class Project < ApplicationRecord

	belongs_to :team

	has_many :lists
	has_many :tasks

end
