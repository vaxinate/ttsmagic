namespace :cards do
  desc 'scrape and import all the cards from mtgapi'
  task :import => :environment do
    sets = JSON.parse HTTParty.get("http://api.mtgapi.com/v1/list/sets").body
    sets.each do |set_name|
      Card.import_set(set_name)
    end
  end
end
