class Api::V1::SessionsController < ApplicationController
  def create
    candidate = User.find_by_email_insensitive(params[:email])
    user = nil
    if candidate
      user = login(candidate.email, params[:password], true)
    end

    if user
      render :json => {:user => user.id}
    else
      render :json => {:error => 'Unauthorized'}, :status => 401
    end
  end

  def destroy
    logout
    render :json => {}
  end
end
