class Category
    @@all = []

    attr_reader :name
    attr_accessor :lessons

    def initialize(name)
        @name = name
        @lessons = []
        self.all << self
    end

    def self.all
        @@all
    end

    def add_lesson(lesson)
        lessons << lesson
        lesson.category = self
    end
end