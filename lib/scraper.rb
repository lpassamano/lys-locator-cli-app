require "nokogiri"
require "open-uri"
require "pry"

class Scraper

  def self.search(location)
    # instantiate SearchTerm here
    url = "http://www.knitmap.com/search_results?origin=#{location}"
    site = Nokogiri::HTML(open(url))

    site.css("div#location_list div.location").each do |store|
      store_hash = Hash.new
      stars = store.css("div.rating-review img").collect do |star|
        star.attribute("alt").value
      end
      #binding.pry
      if store.css("div.location-info h3.closed a") == []
        store_hash[:name] = store.css("div.location-info h3 a").text
        store_hash[:address] = store.css("div.location-info p").text
        store_hash[:rating] = stars.count("Rating-star")
      end
      Store.new(store_hash)
      #add new Store instance to SearchTerm instance
    end
  end

  def self.store_page(url)
    #takes in a url for an individual store_page
    #uses nokogiri and open uri to get data from site
    #parses data to get data for lys
      # store data will be stored in a hash with :name, :hours, :address
      # include :reviews?
      # push this into original store hash?
  end

end
