require 'nokogiri'
require 'open-uri'

class Scraper
  @@lessons = []

  def self.lessons
    @@lessons
  end

  def self.scrape_lessons_page
    doc = Nokogiri::HTML(open('./fixtures/site/lessons.html'))
    doc.css('div.prose').each_with_index do |lesson, index|
      title = lesson.css('h3').text
      self.lessons << {id: index,  title: title}
    end
    binding.pry
  end

  def self.scrape_lesson
  end
end
