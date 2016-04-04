class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Exception
  rescue_from ActionController::RoutingError, ActiveRecord::RecordNotFound, with: :render_404
  rescue_from Exception, with: :render_500
  rescue_from ActiveRecord::RecordInvalid, ActiveRecord::RecordNotSaved, ActionController::InvalidAuthenticityToken, with: :render_422

  def render_404
    render file: "layouts/404.html", status: 404
  end

  def render_422
    render file: "layouts/422.html", status: 422
  end

  def render_500
    render file: "layouts/500.html", status: 500
  end
end
