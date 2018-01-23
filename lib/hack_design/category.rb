class Category
    @@all = []

    attr_accessor :id, :name, :lessons

    def initialize(id, name)
        @name = name
        @lessons = []
        self.class.all << self
    end

    def self.all
        @@all
    end

    def add_lesson(lesson)
        self.lessons << lesson unless self.lessons.include?(lesson)
        lesson.category = self unless lesson.category
    end
end
