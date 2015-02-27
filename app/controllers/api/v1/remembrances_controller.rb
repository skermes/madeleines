class Api::V1::RemembrancesController < Api::V1::ApiController
  before_filter :require_login

  def bite
    render_json Remembrance.bite_for(current_user)
  end

  def drop
    todays = Remembrance.bite_for(current_user)
    todays.drop
    render_json todays
  end

  def pick_up
    todays = Remembrance.bite_for(current_user)
    todays.pick_up
    render_json todays
  end

  def bake
    item = LinkedItem.from_url(params[:url])

    if item.valid?
      remembrance = Remembrance.from_linked_item(item, current_user)
      render_json({:successful => true})
    else
      render_json({:successful => false, :reasons => item.errors})
    end
  end
end
