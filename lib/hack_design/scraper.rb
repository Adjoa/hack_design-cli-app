require 'nokogiri'
require 'open-uri'

class Scraper
  def self.scrape_index_page(index_url)
    categories = []
    doc = Nokogiri::HTML(open(index_url))
    binding.pry
    doc.css('div.overflow-hidden.mb4').each_with_index do |category, index|
      name = category.css('h4').text.strip
      id = index

      lessons = []
      # category.css('+div h3') #=> "Hello World"
      # category.css('+div h3').each.with_index do |lesson, index|
      #   lessons << { lesson_title:lesson.text, lesson_id: index }
      # end

      categories << { name: name, id: id, lessons: lessons }
    end

    categories
  end
end
