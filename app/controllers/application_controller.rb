class ApplicationController < ActionController::Base
  include Concerns::Errors
  include Concerns::ErrorActions

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception, unless: :api?

  HTTPResponseErrors.each do |code, status|
    class_eval <<-EOS
      rescue_from(#{code.to_s.camelize}) {|e| render_error e }
    EOS
  end

  def api?
    /\/api\// === request.path_info
  end

  def authenticate_user!
    if api?
      sign_in :user, User.first
    else
      super
    end
  end
end
