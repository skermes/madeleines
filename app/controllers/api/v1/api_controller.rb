class Api::V1::ApiController < ApplicationController
  def not_authenticated
    render :json => {:error => 'Not Authenticated'}, :status => 401
  end
end
