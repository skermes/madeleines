class Api::V1::RemembrancesController < ApplicationController
  def bite
    render :json => Remembrance.bite_for(current_user)
  end

  def drop
    todays = Remembrance.bite_for(current_user)
    todays.drop
    render :json => todays
  end

  def pick_up
    todays = Remembrance.bite_for(current_user)
    todays.pick_up
    render :json => todays
  end

  def bake
    item = LinkedItem.from_url(params[:url])

    if item.valid?
      remembrance = Remembrance.from_linked_item(item, current_user)
      render :json => {'baked' => true}
    else
      render :json => {'baked' => false, 'reasons' => item.errors}
    end
  end
end
