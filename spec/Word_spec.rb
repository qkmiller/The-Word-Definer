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
      expect(new_word.definition).to(eq(["blank definition"]))
    end
  end

end
