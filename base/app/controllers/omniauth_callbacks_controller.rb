class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    @user = User.find_or_create_for_facebook_oauth(env['omniauth.auth'],current_user)

    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication
    end
  end

  def linkedin
    @user = User.find_or_create_for_linkedin_oauth(env['omniauth.auth'],current_user)

    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication
    end
  end

  def Fpgaming
    @user = User.find_or_create_for_fpgaming_oauth(env['omniauth.auth'],current_user)

    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication
    end
  end


end
