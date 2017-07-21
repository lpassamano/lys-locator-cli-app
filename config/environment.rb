require "bundler/setup"
Bundler.require(:default, :development)

require "pry"
require "nokogiri"
require "open-uri"
require "colorize"
require "terminal-table"

require_all "lib"
