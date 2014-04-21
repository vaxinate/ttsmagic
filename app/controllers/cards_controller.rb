class CardsController < ApplicationController

  def search
    @cards = Card.search(params[:q])

    respond_to do |format|
      format.json { render json: @cards.to_json }
    end
  end

end
