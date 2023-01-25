# frozen_string_literal: true

class Api::V1::User::SessionsController < Api::V1::User::AppController 

  # post 'users/sign_up'
  def sign_up
    user = User.new(user_params)
    #if user.save
    user.save!
    render json: { success: true, confirmation_token: user.confirmation_token }, status: :created
    #  render json: {success: true}, status: :created
    #else
      #render json: {success: false, errors: user.errors.as_json}, status: :bad_request
    #end
  end
  # post 'users/sign_in'
  def sign_in
  end
  #delete 'users/sign_out'
  def sign_out
  end
  # get 'users/me'
  def me
  end

  def confirm
    user = User.find_by(confirmation_token: params[:confirmation_token])
    render json: { success: user.confirm }
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name)
  end

end
