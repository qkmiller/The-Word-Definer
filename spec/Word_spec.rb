require('Word')
require('rspec')
require('pry')

describe (WordModule::Word) do
  describe('#definition') do
    it('should return an array') do
      new_word = WordModule::Word.new("Blank")
      expect(new_word.definition).to(eq([]))
    end
  end
end
