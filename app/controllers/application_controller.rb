class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  unless Rails.env.production?
    rescue_from ActionController::InvalidCrossOriginRequest do
      unless Rails.application.config.consider_all_requests_local
        render_404
      end
    end
  end
end
