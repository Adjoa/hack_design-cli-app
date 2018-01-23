class Category
    @@all = []

    attr_accessor :id, :name, :lessons

    def initialize(name)
        @name = name
        @lessons = []
        self.class.all << self
    end

    def self.all
        @@all
    end

    def add_lesson(lesson)
        lessons << lesson
        lesson.category = self
    end
end
