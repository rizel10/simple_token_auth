class Api::V1::Authentication::RegistrationsController < ApplicationController
  before_action :authenticate_user!, only: [:destroy]
  skip_after_action :build_response_headers, only: [:destroy]

  def create
    @user = User.create!(sign_up_params)
    @user.created_auth = @user.authentications.create!
  end

  def destroy
    @user.destroy!
  end

  private

  def sign_up_params
    params.permit(:email,:password)
  end

end
