module ApplicationHelper
	def admin_signed_in?
		return false unless user_signed_in?
		return current_user.admin
	end

	def yes_or_no bool_Value
		if bool_Value == true
			"Tak"
		else
			"Nie"
		end
	end
end
