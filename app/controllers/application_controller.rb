class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  around_filter :set_time_zone

  def set_time_zone(&block)
    #time_zone = current_user.try(:time_zone) || 'UTC'
    time_zone = 'Pacific Time (US & Canada)'
    Time.use_zone(time_zone, &block)
  end
end
