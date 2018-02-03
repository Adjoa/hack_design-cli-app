require 'nokogiri'
require 'open-uri'

class Scraper
  def self.scrape_index_page(index_url)
    doc = Nokogiri::HTML(open(index_url))
    binding.pry

    lessons = []
    doc.css('div.flex-center.mb4').each_with_index do |lesson, index|
        lessons << {id: index,  title:lesson.text}
    end
  end
end
