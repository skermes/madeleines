class Api::V1::SettingsController < Api::V1::ApiController
  before_filter :require_login

  def index
    render_json(current_user.settings_with_defaults)
  end

  def update
    current_user.settings = params[:settings]

    if current_user.valid?
      current_user.save
      render_json({:saved => true})
    else
      render_json({:saved => false, :reasons => user.errors})
    end
  end
end
