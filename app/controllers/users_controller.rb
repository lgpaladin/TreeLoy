class UsersController < ApplicationController

	def show
		@user = current_user
		@teams = @user.teams
		@projects = @user.projects
	end	
end
