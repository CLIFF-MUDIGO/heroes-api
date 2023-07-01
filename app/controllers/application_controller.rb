class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception, prepend: true

    # Ensure CSRF token is included in JSON requests
    before_action :set_csrf_cookie
  
    private
  
    def set_csrf_cookie
      cookies["CSRF-TOKEN"] = form_authenticity_token
    end
end
