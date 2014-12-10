class StaticPagesController < ApplicationController
  
  before_action :setup

  def index
  end

  private
  	def setup
  		if user_signed_in?
  			@activities = PublicActivity::Activity.all.order("created_at DESC")
  		else
  			redirect_to publications_path
  		end
  	end

end
