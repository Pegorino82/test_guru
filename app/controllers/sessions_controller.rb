# frozen_string_literal: true

class SessionsController < Devise::SessionsController
  def create
    super
    flash[:notice] = t('header-nav.creeting', name: " #{current_user.name.capitalize}")
  end
end
