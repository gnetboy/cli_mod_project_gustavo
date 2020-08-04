require 'nokogiri'
require 'open-uri'
require 'pry'
require 'colorize'
require 'colorized_string'
require 'solargraph'
require 'wrapify'

module SfMuseums
    class Fail <StandardError
    end
end

require_relative '../lib/app/scraper.rb'
require_relative '../lib/app/cli.rb'
require_relative '../app/museum.rb'