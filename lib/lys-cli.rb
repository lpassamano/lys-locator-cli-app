class CLI_Interface
  attr_accessor :stores

  def initialize
    @stores = []
  end

  def run
    puts "welcome to LYS Locator!"
    puts "Type in any zip code to find a yarn store near you:"
    location = gets.strip.delete(" ")
    #add in step to remove any spaces from international zip codes
    SearchTerm.new(location)

    self.stores = Scraper.search(location)
    self.stores.each.with_index do |store, i|
      puts "#{i + 1}. #{store.name}, #{store.rating} stars"
    end
    puts "Type the number of the store to get more information:"
    more_info_index = gets.strip.to_i - 1
    store_info = self.stores[more_info_index]
    Scraper.store_page(store_info) #adds returned hash to store's attributes using add by hash method in Store

    puts "#{store_info.name}"
    #uses more info url to scrape more info about the store
    # Store, rating
    # Address
    # hours
    # Website

  end

end

#if no results and they did not input a zipcode
    #ask to submit a zipcode to get more accurate results

#user selects a store to get more information about

#asks user if they want to return to list or search again
  #if return then go back to list of lys near location organized by rating
  #elseif search then start program again
  #else exit and give a goodbye message


#### CLI INTERFACE LAYOUT ####
#
# Welcome to LYS Locator!
# Type in any zip code to find a yarn store near you:

# => 08901

# Your local yarn stores are:
# 1. Store, rating
# 2. Store, rating
# Enter the number of the store to get more information.

# => 1

# Store, rating
# Address
# City, State, zip
# hours
# Website
#
# Would you like to return to the list, search again, or exit?

# =>exit
