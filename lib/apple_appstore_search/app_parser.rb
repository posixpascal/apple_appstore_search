require File.expand_path(File.dirname(__FILE__) + '/app')

module AppleAppstoreSearch
  class AppParser


    def initialize(content)
      @html = Nokogiri::HTML(content)
    end

    def fetch()
      app = App.new
      app.logo_url = get_logo_url
      app.name = get_name
      app.rating = get_rating
      app.rates = get_rates
      app.last_updated = get_last_updated
      app.latest_changes = get_latest_changes
      app.version = get_version
      app.size = get_size

      return app
    end

    private
    def get_logo_url()
      @html.css(".we-artwork__image").attr("src")
    end

    def get_name()
      copy = @html.css(".product-header__title")
      copy.search("span").remove()
      copy.text.strip
    end

    def get_rating()
      rate = 0
      rate += @html.css(".rating-star:not(.ghost):not(.half)").size
      rate += @html.css(".rating-star.half").size / 2.0
      "#{rate}"
    end

    def get_rates()
      @html.css(".rating-count").text.gsub(/\s(.+)/, "")
    end

    def get_last_updated()
      @html.css(".version-history__item__release-date").first.text.gsub(/(.+):/, "")
    end

    def get_latest_changes()
      begin 
        @html.css(".product-review p")[1].to_html
      rescue 
        return "-"
      end
    end

    def get_version()
      @html.css(".version-history__item__version-number").first.text
    end

    def get_size()
      @html.css(".information-list__item__definition")[1].text
    end
  end
end
