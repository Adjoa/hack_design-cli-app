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

end
