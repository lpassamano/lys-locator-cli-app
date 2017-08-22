require "terminal-table"
class CLI_Interface

  def run
    puts "\n"
    puts "*********************************************************".colorize(:light_cyan)
    puts "***************  ".colorize(:light_cyan) +  "welcome to LYS Locator!" + "  ***************".colorize(:light_cyan)
    puts "*********************************************************".colorize(:light_cyan)
    search (location)
    display_stores_list
    #more_information
    display_more_information (selected_store)
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
      rows = []
      Store.all.each.with_index do |store, i|
        rows << ["#{i + 1}", store.name, store.rating]
      end
      table = Terminal::Table.new :headings => ["", "Store", "Rating"], :rows => rows
      puts "\n"
      puts table
    end
  end

  def selected_store
    puts "\n"
    puts "Type the number of the store to get more information:"
    store_index = gets.strip.to_i
    #test to see if it is between 1 and Store.all.length
    if store_index >= 1 && store_index <= Store.all.length
      store_index - 1
    else
      selected_store
    end
  end

  def display_more_information (store_index)
    store_info = Store.all[store_index]
    if store_info.street_address == nil
      Scraper.store_page(store_info)
    end
    rows = [
      ["Rating", store_info.rating],
      ["Address", store_info.street_address],
      ["", store_info.region],
      ["Phone", store_info.phone_number],
      ["Website", store_info.website],
      ["Store Hours", store_info.hours]
    ]
    table = Terminal::Table.new :title => store_info.name, :headings => [], :rows => rows
    puts "\n"
    puts table
  end

  def menu
    puts "\n"
    puts "Would you like to return to the list, search, or exit?"
    user_choice = gets.strip.downcase
    case user_choice
    when "list"
      display_stores_list
      display_more_information (selected_store)
      menu
    when "search"
      search (location)
      display_stores_list
      display_more_information (selected_store)
      menu
    when "exit"
      puts "\n"
      puts "Thanks for using LYS Locator!"
      puts "*********************************************************".colorize(:light_cyan)
    else
      puts "\n"
      puts "Please select 'list' to return to your search, 'search' to search again, or 'exit' to leave LYS Locator."
      menu
    end
  end

end
