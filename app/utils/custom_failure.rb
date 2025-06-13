class CustomFailure < Devise::FailureApp
  def respond
    json_api_error_response
  end

  def json_api_error_response
    self.status = 401
    self.content_type = 'application/json'
    self.response_body = {
      message: "Falha ao tentar realizar o login, tente novamente!",
      status: 401,
      statusText: "Unauthorized"
    }.to_json
  end
end