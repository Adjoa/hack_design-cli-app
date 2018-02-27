class Lesson
    @@all = []

    attr_accessor :url, :title, :instructor, :introduction, :exercises

    def initialize(title, url)
        @url = url
        @title = title

        @@all << self
    end

    def self.all
        @@all
    end

    def self.create_from_collection(lessons_array)
      lessons_array.each do |lesson|
        self.new(lesson[:title], lesson[:url])
      end
    end

    def add_attributes(lesson_attr)
      self.tap do |lesson|
        lesson.instructor = lesson_attr[:instructor]
        lesson.introduction = lesson_attr[:introduction]
        lesson.exercises = lesson_attr[:exercises]
      end
    end
end
