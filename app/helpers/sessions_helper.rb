# frozen_string_literal: true

module SessionsHelper
  def flash_alert
    render 'sessions/alert', css_class: 'flash_alert' if flash[:alert]
  end
end
