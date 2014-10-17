class Api::V1::RemembrancesController < ApplicationController
  def bite
    render :json => Remembrance.bite
  end

  def drop
  end

  def bake
  end
end
