class ApplicationController < ActionController::Base
  before_action :authorize #for entering if the person is only authorised
  # For APIs, you may need to use :null_session instead.
  protect_from_forgery with: :exception
  def authorize
    unless User.find_by(id: session[:user_id])
      redirect_to login_url, notice: "Please log in"
    end
  end
end
