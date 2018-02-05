require 'nokogiri'
require 'open-uri'

class Scraper
  def self.scrape_lessons_page
    html = File.read("./fixtures/site/lessons.html")
    doc = Nokogiri::HTML(open(html))
    binding.pry

    lessons = []
    doc.css('div.flex-center.mb4').each_with_index do |lesson, index|
        lessons << {id: index,  title:lesson.text}
    end
  end
end
