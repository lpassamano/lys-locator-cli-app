class CLI_Interface
  attr_accessor :stores

  def initialize
    @stores = []
  end

  def run
    puts "welcome to LYS Locator!"
    search (location)
    display_stores_list
    more_information
    menu
  end

  def location
    puts "Type in any zip code to find a yarn store near you:"
    gets.strip.delete(" ")
    #add in step to remove any spaces from international zip codes
  end

  def search (location)
    self.stores = Scraper.search(location)
  end

  def display_stores_list
    #add if statement in case there are no results
    self.stores.each.with_index do |store, i|
      puts "#{i + 1}. #{store.name}, #{store.rating} stars"
    end
  end

  def more_information
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
  end

  def menu
    puts "Would you like to return to the list, search, or exit?"
    user_choice = gets.strip.downcase
    case user_choice
    when "list"
      display_stores_list
      more_information
      menu
    when "search"
      search (location)
      display_stores_list
      more_information
      menu
    when "exit"
      puts "Thanks for using LYS Locator!"
    else
      puts "Please select 'list' to return to your search, 'search' to search again, or 'exit' to leave LYS Locator."
      menu
    end
  end

end
