class User < ApplicationRecord
  has_secure_password

  def generate_password_and_authen_credential
    string_length = 8
    passwd = rand(36**string_length).to_s(36)
    self.password = passwd
    self.credential = ActionController::HttpAuthentication::Basic.encode_credentials(username, passwd)
  end
end
