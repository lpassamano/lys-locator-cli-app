require "nokogiri"
require "open-uri"
require "pry"

class Scraper

  def self.search(location)
    #takes in a location (zipcode, city/state, city/country)
    #interpolates location into url string
    #uses nokogiri and open uri to get data from site
    #parses data to get list of lys
      #each lys is contained in a hash with :name, :rating, :url
    #returns array of local lys organized by rating
    #needs a response for no results - see if they included a city & state/country
    #suggest they try by another search
    stores = []
    url = "http://www.knitmap.com/search_results?origin=#{location}"
    #will need to refactor this to accept cit/state etc.
      #words are separated by "%2C%20" and converted to lowercase
    site = Nokogiri::HTML(open(url))

    #site.css("div#location_list div.location") #all shop information

    site.css("div#location_list div.location").each do |location|
      #location.css("div.location-info h3 a").text - store name
      #location.css("div.location-info p").text - store address
      #location.css("div.rating-review img").attribute("alt").value - store rating
        #will need to iterate over the images in this div
        #images with alt == "Rating-no-star" vs. "Rating-star" to determine store's rating
    end

    binding.pry
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

Scraper.search("08901")
