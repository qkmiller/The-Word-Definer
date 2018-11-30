module WordModule
  class Word

    attr_accessor :word_name, :definition_list
    attr_accessor :id

    @@word_list = []
    @@word_id_list = []

    def initialize(word)
      @word_name = word
      @definition_list = []
      @id = (@@word_list.length) +1
    end

    def add_definition(definition)
      @definition_list.push(definition)
    end

    def save
      @@word_list.push(self.word_name)
      @@word_id_list.push(self.id)
    end

    def self.clear
      @@word_list = []
      @@word_id_list = []
    end

    def self.all
      @@word_list
    end

    def self.see_word_ids
      @@word_id_list
    end
  end
end
