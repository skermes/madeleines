class Api::V1::ApiController < ApplicationController
  protect_from_forgery with: :null_session

  def render_json(data, status=200)
    json = {'_authenticity_token' => form_authenticity_token, '_data' => data}
    render :json => json, :status => status
  end

  def not_authenticated
    render_json({:error => 'Not Authenticated'}, status = 401)
  end
end
