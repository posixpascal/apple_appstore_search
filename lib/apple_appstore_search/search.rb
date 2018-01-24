require 'rubygems'
require 'nokogiri'
require 'open-uri'
require File.expand_path(File.dirname(__FILE__) + '/app_parser')

module AppleAppstoreSearch
  class Search
    attr_accessor :current_page, :keyword

    def initialize(search_condition = {})
      
    end

    def search(app_id, options={:lang => :de})
      url = build_url app_id, options

      app = AppleAppstoreSearch::AppParser.new(open(url).read())
      return app.fetch
    end

    private
    def build_url(app_id, options)
      "https://itunes.apple.com/#{options[:lang]}/app/apple_appstore_search_gem/id#{app_id}?l=#{options[:lang]}&ls=1&mt=8"
    end
  end
end

