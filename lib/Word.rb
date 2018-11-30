module WordModule
  class Word

    attr_accessor :word_name, :definition_list

    @@word_list = []

    def initialize(word)
      @word_name = word
      @definition_list = []
    end

    def add_definition(definition)
      @definition_list.push(definition)
    end

    def save
      @@word_list.push(self.word_name)
    end

    def self.all
      @@word_list
    end
  end
end
