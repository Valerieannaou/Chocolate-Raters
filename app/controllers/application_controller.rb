class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :admin?
  def admin?
    if current_user
    if current_user.email == "j-moore@ou.edu" ||  current_user.email == "chocolateraters@gmail.com" ||current_user.email == "jmoore2002@gmail.com"  ||current_user.email == "fuad@nascenia.com"  || current_user.email == "sifat@nascenia.com"
      return true

    else
      return false
    end
    else
      return false
    end
  end
  def authorize
    if !(current_user)
    redirect_to root_path
    elsif !(current_user.admin == 1)
      redirect_to root_path
    end
  end
end
