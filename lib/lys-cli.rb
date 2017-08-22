class CLI_Interface

  def run
    puts "\n"
    puts "*********************************************"
    puts "********** welcome to LYS Locator! **********"
    puts "*********************************************"
    search (location)
    display_stores_list
    more_information
    menu
  end

  def location
    puts "\n"
    puts "Type in any zip code to find a yarn store near you:"
    input = gets.strip.delete(" ")
  end

  def search (location)
    Store.all = Scraper.search(location)
  end

  def display_stores_list
    if Store.all == []
      puts "\n"
      puts "Sorry, no results found!"
      search (location)
      display_stores_list
    else
      puts "\n"
      Store.all.each.with_index do |store, i|
        puts "#{i + 1}. #{store.name}, #{store.rating}"
      end
    end
  end

  def more_information
    puts "\n"
    puts "Type the number of the store to get more information:"
    more_info_index = gets.strip.to_i - 1
    store_info = Store.all[more_info_index]
    if store_info.street_address == nil
      Scraper.store_page(store_info)
    end
    puts "\n"
    puts "#{store_info.name}, #{store_info.rating} stars"
    puts "#{store_info.street_address}"
    puts "#{store_info.region}"
    puts "#{store_info.phone_number}"
    puts "#{store_info.website}"
    puts "#{store_info.hours}"
  end

  def menu
    puts "\n"
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
      puts "\n"
      puts "Thanks for using LYS Locator!"
    else
      puts "\n"
      puts "Please select 'list' to return to your search, 'search' to search again, or 'exit' to leave LYS Locator."
      menu
    end
  end

end
