class UsersController < ApplicationController 

  def register
    @user = User.new(user_params)
    if @user.save
      UserNotifierMailer.send_signup_email(@user).deliver
      render json: "#{@user.email} registered!"
    else
      render json: @user.errors
    end
  end

  def login
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      token = JsonWebToken.encode(user_id: @user.id)
      time = Time.now + 24.hours.to_i
      render json: {
        user: @user.email,
        token: token,
        exp: time.strftime("%m-%d-%Y %H:%M")
        }, status: :ok
    else
      render json: { error: 'unauthorized' }, status: :unauthorized
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
