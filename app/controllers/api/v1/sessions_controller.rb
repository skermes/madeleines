class Api::V1::SessionsController < Api::V1::ApiController
  def create
    candidate = User.find_by_email_insensitive(params[:email])
    if candidate
      user = login(candidate.email, params[:password], true)
    else
      user = User.build(params[:email], params[:password])
      user = login(user.email, params[:password], true) if user.valid?
    end

    if user and user.valid?
      render_json({:user => user.id})
    else
      not_authenticated
    end
  end

  def destroy
    logout
    render_json({})
  end
end
