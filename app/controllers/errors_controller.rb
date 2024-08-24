class ErrorsController < ApplicationController
  layout "staff"

  def not_found
    render status: 404
  end

  def unprocessable_entity
    render statys: 422
  end

  def internal_server_error
    render status: 500
  end
end
