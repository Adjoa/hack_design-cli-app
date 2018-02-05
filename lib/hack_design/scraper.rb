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

  def self.scrape_lesson(lesson_id)
    base_url = './fixtures/site/lessons/'
    lesson_url = base_url + lesson_id.to_s
    doc = Nokogiri::HTML(open(lesson_url))

    instructor = doc.css('div.mr2 h2').text.strip
    introduction = doc.css('div.prose-intro').text.strip
    exercises = []

    doc.css('div.mb4 ol li.mb3').each do |exercise|
      title = exercise.css('h3 a.red').text.strip
      description = exercise.css('p').text.strip
      url = exercise.css('h3 a.red').attribute('href').text
      exercises << {title: title, description: description, url:url}
    end

    lesson = {}
    lesson[:instructor] = instructor
    lesson[:introduction] = introduction
    lesson[:exercises] = exercises
    lesson
  end

end
