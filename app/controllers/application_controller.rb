class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :admin?
  def admin?
    if current_user
    if current_user.admin== 1
      return true

    else
      return false
    end
    else
      return false
    end
  end
end
