module ApplicationHelper
	def admin_signed_in?
		return false unless user_signed_in?
		return current_user.admin
	end
end
