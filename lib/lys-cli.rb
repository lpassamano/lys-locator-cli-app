class CLI_Interface

  def self.run
    puts "welcome to LYS Locator!"
    puts "Type in any zip code to find a yarn store near you:"
    input = gets.strip
    zipcode = SearchTerm.new(input)

    stores = Scraper.search(input)
    stores.each.with_index do |store, i|
      puts "#{i + 1}. #{store.name}, #{store.rating}"
    end
  end

end

#get location in form of zip code or city/state/country

#return a list of lys near the location organized by rating

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
