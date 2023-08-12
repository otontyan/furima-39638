class ApplicationController < ActionController::Base
  before_action :basic_auth
  #before_action :authenticate_user! # ここでいいのか？  
  before_action :configure_permitted_parameters, if: :devise_controller?


  private

  def configure_permitted_parameters #カラムに保存
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nick_name, :family_name_kanji, :personal_name_kanji, :family_name_kana, :personal_name_kana, :birthdate])
  end

  def basic_auth #Basic認証
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]  # 環境変数を読み込む記述に変更
    end
  end
end