class Api::V1::SessionsController < ApplicationController
  def create
    candidate = User.find_by_email_insensitive(params[:email])
    if candidate
      user = login(candidate.email, params[:password], true)
    else
      user = User.build(params[:email], params[:password])
      user = login(user.email, params[:password], true) if user.valid?
    end

    if user and user.valid?
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
