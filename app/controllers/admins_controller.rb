class AdminsController < ApplicationController
	def users
		@users = User.where.not(id: current_user.id)
	end

	def destroy_user
		User.destroy(params[:id])
		render 'users'
	end
end
