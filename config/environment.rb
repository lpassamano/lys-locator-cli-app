require "bundler/setup"
Bundler.require(:default, :development)

require "pry"
require "nokogiri"
require "open-uri"
require "colorize"
require "terminal-table"

#require_all "lib"
#FIX THIS!!!
require_relative "../lib/lys-cli.rb"
require_relative "../lib/scraper.rb"
require_relative "../lib/search-term.rb"
require_relative "../lib/store.rb"
