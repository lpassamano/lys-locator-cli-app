

class Scraper

  def search(location)
    #takes in a location (zipcode, city/state, city/country)
    #interpolates location into url string
    #uses nokogiri and open uri to get data from site
    #parses data to get list of lys
      #each lys is contained in a hash with :name, :rating, :url
    #returns array of local lys organized by rating
  end

  def store_page(url)
    #takes in a url for an individual store_page
    #uses nokogiri and open uri to get data from site
    #parses data to get data for lys
      # store data will be stored in a hash with :name, :hours, :address
      # include :reviews?
      # push this into original store hash?
  end

end
