class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :configure_permitted_parameters, if: :devise_controller?
  # デバイスコントローラーの場合のみストロングパラメーターを実行
  before_action :authenticate_user!, only: [:new]
  # 出品時にログインしていない場合はログイン画面に推移する
  private
  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"] 
    end
  end
  # Basic認証において環境変数を読み込む

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :last_name, :first_name, :last_name_kana, :first_name_kana, :birthday])
  end
  # サインアップ時のストロングパラメーターを定義
end
