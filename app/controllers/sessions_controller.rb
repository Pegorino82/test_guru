# frozen_string_literal: true

class SessionsController < ApplicationController
  skip_before_action :authenticate_user!

  def new; end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      unauthenticated_url = cookies[:unauthenticated_url]
      cookies.delete(:unauthenticated_url)
      redirect_to unauthenticated_url || tests_path
    else
      flash.now[:alert] = 'You need to verify your email and password'
      render :new
    end
  end

  def destroy
    session.clear
    cookies.delete(:unauthenticated_url)
    redirect_to root_path
  end
end
