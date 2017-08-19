class SearchTerm
  # stores all Store instances in an array  that are a result of a certain search term
  attr_accessor :search_term, :stores

  def initialize (search_term)
    @search_term = search_term
    @stores = []
  end

end
