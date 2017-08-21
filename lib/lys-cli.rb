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
    #check to see if we have info stored already and if not then scrape it
    Scraper.store_page(store_info)
    puts "#{store_info.name}, #{store_info.rating} stars"
    puts "#{store_info.street_address}"
    puts "#{store_info.region}"
    puts "#{store_info.phone_number}"
    puts "#{store_info.website}"
    puts "#{store_info.hours}"

    puts "Would you like to return to the list, search, or exit?"
    user_choice = gets.strip.downcase
    case user_choice
    when "list"
      #access array of stores from the SearchTerm or Scraper class?
      # or just rerun the scraper
    when "search"
      #fix this later after #run is split into multiple methods
      self.run
    when "exit"
      puts "Thanks for using LYS Locator!"
    else
      puts "Please select 'list' to return to your search, 'search' to search again, or 'exit' to leave LYS Locator."
    end
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
