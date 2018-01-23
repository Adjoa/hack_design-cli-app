require 'nokogiri'
require 'open-uri'

class Scraper
  def self.scrape_index_page(index_url)
    categories = []
    doc = Nokogiri::HTML(open(index_url))

    doc.css('div.overflow-hidden.mb4').each_with_index do |category, index|
      name = category.css('h4').text.strip
      id = index

      categories << { name: name, id: id }
    end
    binding.pry
    categories
  end
end
