require File.expand_path(File.dirname(__FILE__) + '/app')

module AppleAppstoreSearch
  class AppParser


    def initialize(content)
      @html = Nokogiri::HTML(content)
    end

    def parse
      create_app @html.css("#left-stack")
    end

    private
    def get_logo_url(app_content)
      app_content.css("div.artwork img").attr("src-swap-high-dpi")
    end

    def get_name(app_content)
      @html.css("#title .left h1").text
    end

    def get_rating(app_content)
      rate = 0
      rate += app_content.css(".rating-star:not(.ghost):not(.half)").size
      rate += app_content.css(".rating-star.half").size / 2.0
      "#{rate}"
    end

    def get_rates(app_content)
      app_content.css(".rating-count").text.gsub(/\s(.+)/, "")
    end

    def get_last_updated(app_content)
      app_content.css(".release-date").first.text.gsub(/(.+):/, "")
    end

    def get_latest_changes(app_content)
      begin 
        @html.css(".product-review p")[1].to_html
      rescue 
        return "-"
      end
    end

    def get_version(app_content)
      app_content.css(".list li")[3].text.gsub(/(.+):/, "")
    end

    def get_size(app_content)
       app_content.css(".list li")[4].text.gsub(/(.+):/, "")
    end

    def create_app(app_content)
      app = App.new
      app.logo_url = get_logo_url app_content
      app.name = get_name app_content
      app.rating = get_rating app_content
      app.rates = get_rates app_content
      app.last_updated = get_last_updated app_content
      app.latest_changes = get_latest_changes app_content
      app.version = get_version app_content
      app.size = get_size app_content

      return app
    end
  end
end
