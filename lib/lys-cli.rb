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

    #should new SearchTerm be created here or in Scraper
    SearchTerm.new(location)

    self.stores = Scraper.search(location)
    self.stores.each.with_index do |store, i|
      puts "#{i + 1}. #{store.name}, #{store.rating} stars"
    end
    
    more_information

    puts "Would you like to return to the list, search, or exit?"
    user_choice = gets.strip.downcase
    case user_choice
    when "list"
      #access array of stores from the SearchTerm or Scraper class instead?
      self.stores.each.with_index do |store, i|
        puts "#{i + 1}. #{store.name}, #{store.rating} stars"
      end
      more_information
    when "search"
      #fix this later after #run is split into multiple methods
      self.run
    when "exit"
      puts "Thanks for using LYS Locator!"
    else
      puts "Please select 'list' to return to your search, 'search' to search again, or 'exit' to leave LYS Locator."
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

end
