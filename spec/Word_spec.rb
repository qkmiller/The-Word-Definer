require('Word')
require('rspec')
require('pry')

describe (WordModule::Word) do

  describe('#definition_list') do
    it('should return an array') do
      new_word = WordModule::Word.new("Blank")
      expect(new_word.definition_list).to(eq([]))
    end
  end

  describe('#add_definition') do
    it('should add a definition to definition_list') do
      new_word = WordModule::Word.new("Blank")
      new_word.add_definition("blank definition")
      expect(new_word.definition_list).to(eq(["blank definition"]))
    end
  end

  describe('#all') do
    it('should list all instances of Word') do
      new_word = WordModule::Word.new("Blank")
      new_word2 = WordModule::Word.new("Test")
      new_word.save
      new_word2.save
      expect(WordModule::Word.all).to(eq(["Blank", "Test"]))
    end
  end
  describe('#see_word_ids') do
    it('should list the unique IDs for all instances of word') do
      new_word = WordModule::Word.new("Blank")
      new_word2 = WordModule::Word.new("Test")
      new_word.save
      new_word2.save
      expect(WordModule::Word.see_word_ids).to(eq([1, 2]))
    end
  end
end
