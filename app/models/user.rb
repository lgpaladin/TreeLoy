class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_and_belongs_to_many :teams

  has_many :notifications
  has_many :comments
  has_many :tasks, foreign_key: :owner_id
  has_many :projects, through: :teams

  has_and_belongs_to_many :jobs, class_name: 'Task'

end
