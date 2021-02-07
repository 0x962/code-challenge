class ApplicationController < ActionController::Base
  include Pundit

  def authorize!(x, y)
    true
  end
end
