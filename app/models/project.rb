class Project < ApplicationRecord

	belongs_to :team

	has_many :lists
	has_many :tasks


  # add lat lng by migration
  acts_as_mappable default_units: :kms
end
