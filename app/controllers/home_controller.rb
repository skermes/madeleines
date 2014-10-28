class HomeController < ApplicationController
  def index
  end

  def four_oh_four
    render :index, :status => 404
  end
end
