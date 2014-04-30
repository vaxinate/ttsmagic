class DecksController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create
    logger.info params[:card_ids]
    images = Magick::ImageList.new
    # pull down card art
    params[:card_ids].each do |gatherer_id|
      local_target = Rails.root.to_s + "/tmp/cards/#{gatherer_id}.jpg"
      remote_target = "http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=#{gatherer_id}&type=card"
      unless File.exist?(local_target)
        File.open(local_target, 'wb') { |f| f.write HTTParty.get(remote_target).parsed_response }
      end

      images.read(local_target)
    end

    tts_image = images.montage do
      self.tile = '10x7'
      self.geometry = '223x310+1+1'
    end

    deck_md5 = Digest::MD5.hexdigest(params[:card_ids].sort.join)
    tts_image.write Rails.root.to_s + "/tmp/decks/#{deck_md5}.jpg"
  end
end
