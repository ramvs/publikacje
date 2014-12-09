class AdminsController < ApplicationController
	
	def users
		@users = User.where.not(id: current_user.id)
		authorize! :read , User
	end

	def destroy_user
		authorize! :destroy , User
		User.destroy(params[:id])
		redirect_to users_administrator_path
	end

	def edit_user
		authorize! :edit , User
		@user = User.find(params[:id])
		if @user == nil
			flash[:danger] = "User not found!"
			redirect_to users_administrator_path
		end
	end

	def update_user
		authorize! :edit , User
		@user = User.find(params[:id])
		if @user.update_attributes(user_params)
			flash[:notice] = "Zapisano zmiany"
			redirect_to users_administrator_path
		else
			flash[:danger] = "Cannot update"
			render 'edit_user'
		end
		if @user.reminder.present?
 			ReminderMailer.reminder_mail(@user).deliver
		end

	end

	private
		def user_params
			params.require(:user).permit(:admin,:approved,:reminder)
		end
end
