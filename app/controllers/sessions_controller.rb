# frozen_string_literal: true

class SessionsController < Devise::SessionsController
  def create
    super
    flash[:notice] = "Hi, #{current_user.name.capitalize!}!"
  end
end
