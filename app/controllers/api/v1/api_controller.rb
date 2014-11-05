class Api::V1::ApiController < ApplicationController
  def render_json(data, status=200)
    json = data.as_json
    json['_authentication_token'] = form_authenticity_token
    render :json => json, :status => status
  end

  def not_authenticated
    render_json({:error => 'Not Authenticated'}, status = 401)
  end
end
