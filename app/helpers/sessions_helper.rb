module SessionsHelper
  def flash_alert
    render 'sessions/alert' if flash[:alert]
  end
end
