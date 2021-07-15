class ApplicationController < ActionController::API
  before_action :authenticate

  private

  def authenticate
    username, passwd = ActionController::HttpAuthentication::Basic.user_name_and_password(request)

    user = User.find_by_username(username)
    if user.blank? || !user.authenticate(passwd)
      render json: { error: "not authenticated" }, status: :unauthorized
    end

    @current_user = user
  rescue
    render json: { error: "not authenticated" }, status: :unauthorized
  end
end
