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
  end

  def self.scrape_lesson
    base_url = './fixtures/site/lessons/'
    self.lessons.each_with_index do |lesson, index|
      lesson_url = base_url + lesson[:id].to_s
      doc = Nokogiri::HTML(open(lesson_url))
      #instructor = doc.css('div.mr2 h2').text.strip
      #introduction = doc.css('div.mr2 h2').text.strip
      #exercises =
      # doc.css('div.mb4 ol').each do |exercise|
      #  url = exercise.css('a').attribute('href').text
      #  title = exercise.css('li a').text.strip
      #  description = exercise.css('li p').text.strip
      #  puts ""
      # end
    end
  end
end
