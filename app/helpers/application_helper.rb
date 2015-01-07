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

	def only_current_user check
		if check && check=="1" && user_signed_in?
			return current_user.id
		else
			return nil
		end
	end
end
