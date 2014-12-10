class StaticPagesController < ApplicationController
  
  before_action :setup

  def index
  end

  private
  	def setup
  	@activities = PublicActivity::Activity.all.paginate(:page => params[:page],:per_page => 15).order("created_at DESC")
  	end

end
