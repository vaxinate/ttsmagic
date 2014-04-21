class Card < ActiveRecord::Base
  include HTTParty
  base_uri 'http://api.mtgapi.com'

  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  def self.gatherer_find(gatherer_id)
    card = find_by_gatherer_id(gatherer_id)
    return card if card.present?

    data = JSON.parse(get("/v1/card/id/#{gatherer_id}").body).first

    create(
      image_url: data['image'],
      name: data['name'],
      mana: data['mana'].join(''),
      gatherer_id: data['id']
    )
  end
end
