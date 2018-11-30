module WordModule
  class Word

    attr_accessor :word_name, :definition_list

    def initialize(word)
      @word_name = word
      @definition_list = []
    end

  end
end
