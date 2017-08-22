class CLI_Interface

  def run
    puts "\n"
    puts "*********************************************************".colorize(:light_cyan)
    puts "***************  ".colorize(:light_cyan) +  "welcome to LYS Locator!" + "  ***************".colorize(:light_cyan)
    puts "*********************************************************".colorize(:light_cyan)
    search (location)
    display_stores_list
    display_more_information (select_store)
    menu
  end

  def location
    puts "\n"
    puts "Type in any zip code to find a yarn store near you:"
    input = gets.strip.delete(" ")
  end

  def search (location)
    Store.new_search(location)
  end

  def display_stores_list
    if Store.current_search == []
      puts "\n"
      puts "Sorry, no results found!"
      search (location)
      display_stores_list
    else
      rows = []
      Store.current_search.each.with_index do |store, i|
        rows << ["#{i + 1}", store.name, store.rating]
      end
      table = Terminal::Table.new :headings => ["", "Store", "Rating"], :rows => rows
      puts "\n"
      puts table
    end
  end

  def select_store
    puts "\n"
    puts "Type the number of the store to get more information:"
    store_number = gets.strip.to_i
    #test to see if it is between 1 and Store.all.length
    if store_number >= 1 && store_number <= Store.current_search.length
      store_number - 1
    else
      select_store
    end
  end

  def display_more_information (store_index)
    store = Store.current_search[store_index]
    store.get_details
    rows = [
      ["Rating", store.rating],
      ["Address", store.street_address],
      ["", store.region],
      ["Phone", store.phone_number],
      ["Website\n", store.website],
      ["Store Hours", store.hours]
    ]
    table = Terminal::Table.new :title => store.name, :headings => [], :rows => rows
    puts "\n"
    puts table
  end

  def menu
    puts "\n"
    puts "Would you like to RETURN to your results, try a NEW search, or EXIT?"
    user_choice = gets.strip.downcase
    case user_choice
    when "return"
      display_stores_list
      display_more_information (select_store)
      menu
    when "new"
      search (location)
      display_stores_list
      display_more_information (select_store)
      menu
    when "exit"
      puts "\n"
      puts "\n"
      puts "Thank you for using LYS Locator!"
      puts "\n"
      puts "*********************************************************".colorize(:light_cyan)
    else
      puts "\n"
      puts "Please select 'return' to return to your search, 'new' to search again, or 'exit' to leave LYS Locator."
      menu
    end
  end

end
