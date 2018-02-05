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

      instructor = doc.css('div.mr2 h2').text.strip
      introduction = doc.css('div.prose-intro').text.strip
      exercises = []

      doc.css('div.mb4 ol li').each do |exercise|
        title = exercise.css('h3 a').text.strip; puts "#{title}"
        description = exercise.css('p').text.strip; puts "#{description}"
        url = exercise.css('h3 a').attribute('href').text; puts "#{url}"
        # binding.pry
        exercises << {url:url, title: title, description: description}
      end

      lesson[:instructor] = instructor
      lesson[:introduction] = introduction
      lesson[:exercises] = exercises

    end
    # binding.pry
  end

end
