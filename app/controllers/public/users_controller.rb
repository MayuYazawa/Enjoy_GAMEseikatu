class Public::UsersController < ApplicationController
  # before_action :authenticate_customer!	コントローラーに設定して、ログイン済ユーザーのみにアクセスを許可する
  before_action :authenticate_customer!
  before_action :ensure_guest_user, only: [:edit]

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to users_id_path, notice: "You have updated　customer_info successfully."
    else
      render "edit"
    end
  end

  def quit
    @user = current_user
  end

  def withdraw
    @user = current_user
    @user.update(is_deleted: true)

    reset_session
    # 「reset_session」は全てのsessionを削除します
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :gender)
  end

  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.name == "guestuser"
      redirect_to user_path(current_user) , notice: 'ゲストユーザーはプロフィール編集画面へ遷移できません。'
    end
  end
end
