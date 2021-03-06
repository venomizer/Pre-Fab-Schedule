class OauthsController < ApplicationController
  skip_before_filter :require_login

  def oauth
    login_at(params[:provider])
  end

  def callback
    provider = params[:provider]
      if @user = login_from(provider)
        redirect_to root_path, notice: "Logged in from #{provider.titleize}"
      else
        begin
          p = Config.send(provider)
          h = p.get_user_hash
          raise "Naw, motherfucker" unless h[:user_info]['email'] =~ /@technicoolsystems.com$/
          @user = create_from(provider)
          reset_session
          auto_login(@user)
          redirect_to root_path, notice: "Logged in from #{provider.titleize}"
        rescue Exception => e
          redirect_to root_path, alert: "Failed to login from #{provider.titleize} -- #{e.message}"
        end
      end
  end
end
