class Card < ActiveRecord::Base
  include HTTParty
  base_uri 'http://api.mtgapi.com'

  validates :name, uniqueness: true

  def self.import_set(set_name)
    set_uri = "http://api.mtgapi.com/v1/card/set/#{CGI.escape(set_name)}"
    set_cards = JSON.parse get(set_uri).body

    stored_card_names = Card.all.map(&:name).map(&:downcase)
    import_cards = set_cards.reject do |data|
      stored_card_names.include? data['name'].downcase
    end

    import_cards.each do |short_card|
      self.import_card(short_card['id'])
    end
  end

  def self.import_card(gatherer_id)
    data = JSON.parse(get("/v1/card/id/#{gatherer_id}").body).first
    create(
      image_url: data['image'],
      name: data['name'],
      mana: data['mana'].present? ? data['mana'].join('') : nil,
      gatherer_id: data['id']
    )
  end

  private

  def get_card_data(gatherer_id)
    JSON.parse(get("/v1/card/id/#{gatherer_id}").body).first
  end

end
