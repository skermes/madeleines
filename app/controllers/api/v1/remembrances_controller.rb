class Api::V1::RemembrancesController < ApplicationController
  def bite
    render :json => Remembrance.bite
  end

  def drop
    todays = Remembrance.bite
    todays.drop
    render :json => todays
  end

  def bake
  end
end
