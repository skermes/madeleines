class Api::V1::ApiController < ApplicationController
  def render_json(data, status=200)
    json = {'_authenticity_token' => form_authenticity_token, '_data' => data}
    render :json => json, :status => status
  end

  def not_authenticated
    render_json({:error => 'Not Authenticated'}, status = 401)
  end

  # Runs as a Sorcery login source.  See
  # https://github.com/NoamB/sorcery/blob/3251912a79c8a99f5474a793049526631520d693/lib/sorcery/controller/submodules/remember_me.rb#L57
  # and
  # https://github.com/NoamB/sorcery/blob/3251912a79c8a99f5474a793049526631520d693/lib/sorcery/controller.rb#L120
  def login_from_api_key
    user = params[:api_key] && User.find_by_api_key(params[:api_key])
    if user
      auto_login(user)
      return user
    else
      return false
    end
  end
end
