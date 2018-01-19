class Category
    @@all = []

    attr_reader :name
    attr_accessor :lessons

    def initialize(name)
        @name = name
        @lessons = []
        self.all << self
    end

end