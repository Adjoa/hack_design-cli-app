class Lesson
    @@all = []

    attr_accessor :category, :title, :number, :instructor, :introduction, :exercises

    def initialize(title)
        @title = title
        @exercises = []
        self.all << self
    end

    def self.all
        @@all
    end

end