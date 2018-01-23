class Lesson
    @@all = []

    attr_accessor :id, :category, :title, :number, :instructor, :introduction, :exercises

    def initialize(title)
        @title = title
        @exercises = []
        self.class.all << self
    end

    def self.all
        @@all
    end

end
