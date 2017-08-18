require "nokogiri"
require "open-uri"
require "pry"

class Scraper

  def self.search(location)
    #takes in a location (zipcode) -- don't want to take in other data to keep it simple
    #interpolates location into url string
    #uses nokogiri and open uri to get data from site
    #parses data to get list of lys
      #each lys is contained in a hash with :name, :rating, :url
    #returns array of local lys organized by rating
    #needs a response for no results - see if they included a city & state/country
    #suggest they try by another search


    stores = [] #should the stores hash be stored in an array? or in the store class
    #should there be a Zipcode class? to store all of the lys in each zipcode?
    url = "http://www.knitmap.com/search_results?origin=#{location}"
    site = Nokogiri::HTML(open(url))

    site.css("div#location_list div.location").each do |store|
      store_hash = Hash.new
      stars = store.css("div.rating-review img").collect do |star|
        star.attribute("alt").value
      end

      store_hash[:name] = store.css("div.location-info h3 a").text
      store_hash[:address] = store.css("div.location-info p").text
      store_hash[:rating] = stars.count("Rating-star")
      stores << store_hash
      #need to make sure new Store instances are created
    end
    ## NEED TO GO THROUGH AND REMOVE CLOSED STORES H3.CLOSED
    #unless for stores << store_hash?
    #binding.pry
    stores
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

puts Scraper.search("08901")
