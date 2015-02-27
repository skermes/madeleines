class Api::V1::SettingsController < Api::V1::ApiController
  before_filter :require_login

  def index
    render_json(current_user.settings_with_defaults)
  end

  def change_password
    if User.authenticate(current_user.email, params[:old_password])
      current_user.password = params[:new_password]
      current_user.save
      render_json({:successful => true})
    else
      render_json({:successful => false, :reasons => [:bad_password]})
    end
  end

  def update
    current_user.settings = params[:settings]

    if current_user.valid?
      current_user.save
      render_json({:successful => true})
    else
      render_json({:successful => false, :reasons => user.errors})
    end
  end
end
