class Lesson
    @@all = []

    attr_accessor :url, :title, :instructor, :introduction, :exercises

    def initialize(title, url)
        @url = url
        @title = title

        self.class.all << self
    end

    def self.all
        @@all
    end

    def self.create_from_collection(lessons_array)
      lessons_array.each do |lesson|
        self.new(lesson)
      end
    end

    def add_lesson_attributes(lesson_attr)
      self.tap do |lesson|
        lesson.url = lesson_attr[:url]
        lesson.title = lesson_attr[:title]
        lesson.instructor = lesson_attr[:instructor]
        lesson.introduction = lesson_attr[:introduction]
        lesson.exercises = lesson_attr[:exercises]
      end
    end
end
