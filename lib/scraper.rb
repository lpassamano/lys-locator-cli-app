class Scraper

  def search(location)
    stores = []
    url = "http://www.knitmap.com/search_results?origin=#{location}"
    site = Nokogiri::HTML(open(url))

    site.css("div#location_list div.location").each do |store|
      if store.css("div.location-info h3.closed a").text == ""
        store_hash = Hash.new
        store_hash[:name] = store.css("div.location-info h3 a").text
        store_hash[:info_link] = store.css("div.location-info h3 a").attribute("href").value
        store_hash[:rating] = get_rating(store)
        stores << Store.new(store_hash)
      end
    end
    stores
  end

  def get_rating(store)
    rating = ""
    stars = store.css("div.rating-review img").collect do |star|
      star.attribute("alt").value
    end
    stars.each do |star|
      if star == "Rating-star"
        rating = "#{rating}*"
      end
    end
    if rating == ""
      "unrated".colorize(:light_black)
    else
      rating.colorize(:light_yellow)
    end
  end

  def store_page(store)
    site = Nokogiri::HTML(open(store.info_link))
    store_hash = Hash.new

    store_hash[:street_address] = site.css('div#location_details ul li[@itemprop="streetAddress"]').text
    store_hash[:region] = site.css('div#location_details ul div[@itemprop="address"] li[2]').text
    store_hash[:phone_number] = site.css('div#location_details ul li[@itemprop="telephone"]').text
    store_hash[:website] = site.css('div#location_details ul li a[@rel="nofollow"]').text

    hours = site.css("div#location_details div#hours dl").text.strip.delete(" ").split("\n")
    store_hash[:hours] = ""
    while hours.length > 0
        store_hash[:hours] = "#{store_hash[:hours]}#{hours.shift} #{hours.shift}\n"
    end
    store.add_stores_attributes(store_hash)
  end

end
