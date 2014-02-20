class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def all
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    user=User.from_omniauth(request.env["omniauth.auth"])

    if user.persisted?
      flash.notice = "Signed In!"
      sign_in_and_redirect user
    else
      session["devise.user_attributes"] = user.attributes
      redirect_to new_user_registration_url
    end
  end

  alias_method :facebook, :all
  alias_method :twitter, :all

end
