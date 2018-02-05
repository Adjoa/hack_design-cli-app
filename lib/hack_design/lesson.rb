class Lesson
    @@all = []

    attr_accessor :url, :title, :instructor, :introduction, :exercises

    def initialize(title)
        @title = title
        @exercises = []
        self.class.all << self
    end

    def self.all
        @@all
    end

end
