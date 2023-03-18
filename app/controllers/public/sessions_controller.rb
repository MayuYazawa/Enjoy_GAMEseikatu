# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  before_action :user_is_deleted, only: [:create]
  def after_sign_in_path_for(resource)
    games_path
  end
  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  def guest_sign_in
    user = User.guest
    sign_in user
    redirect_to games_path, notice: "guestuserでログインしました。"
  end


  def after_sign_out_path_for(resource)
    new_user_session_path
  end


  def user_is_deleted
    ## 【処理内容1】 入力されたemailからアカウントを1件取得
    @user = User.find_by(email: params[:user][:email])
    ## アカウントを取得できなかった場合、このメソッドを終了する
    return if !@user
    ## 【処理内容2】 取得したアカウントのパスワードと入力されたパスワードが一致してるかを判別
    #if @customer.valid_password?(params[:customer][:password]) && !@customer.status
    if @user.valid_password?(params[:user][:password]) && @user.is_deleted
      redirect_to new_user_registration_path
      ## 【処理内容3】falseではなくtrueだった場合にサインアップページにリダイレクトする
    end
  end
end
