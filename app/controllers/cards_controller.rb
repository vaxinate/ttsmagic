class CardsController < ApplicationController

  def search
    @cards = Card.all

    respond_to do |format|
      format.json { render json: @cards.to_json }
    end
  end

end
