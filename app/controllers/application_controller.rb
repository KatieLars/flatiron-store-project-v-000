class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
#  before_filter :authenticate_user!

    def user_signed_in?
      !!current_user
    end

    def current_user
      @current_user ||= warden.authenticate(:scope => :user)
    end

    def user_session
      current_user && warden.session(:user)
    end



end
