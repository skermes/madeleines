class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

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
