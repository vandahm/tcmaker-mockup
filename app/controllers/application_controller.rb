class ApplicationController < ActionController::Base
  layout :layout_by_resource

  protected

  def layout_by_resource
    return 'auth' if devise_controller?
    return 'application'
  end
end
