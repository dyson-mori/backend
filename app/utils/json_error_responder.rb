module JsonErrorResponder
  extend ActiveSupport::Concern

  def default_json_error_response(status, status_text, message)
    render json: {
      status: status,
      statusText: status_text,
      message: message
    }, status: status
  end
end
