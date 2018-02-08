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

    def list_lessons
      Lesson.all.each_with_index do |lesson, lesson_number|
       puts "#{lesson_number} #{lesson.title}"
      end
    end

    def display_lesson(lesson_number)
      lesson = Lesson.all[lesson_number]
      puts "#{lesson.title}"
      puts "#{lesson.instructor}"
      puts ""
      puts "#{lesson.introduction}"
      puts ""
      puts "Exercises for this lesson: "
      lesson.exercises.each do |exercise|
        puts"#{exercise[:title]}"
        puts "#{exercise[:description]}"
        puts "#{exercise[:url]}"
        puts ""
      end
    end
end
