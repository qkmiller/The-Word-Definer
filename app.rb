
require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/Word')
require('pry')

@@list = []

get('/') do
  @@list = []
  # binding.pry
  erb(:home)
end

post('/') do
  word = WordModule::Word.new(params.fetch("word"))
  word.save
  word_definition = word.definition_list.push(params.fetch("definition"))
  # binding.pry
  @@list.push(word)
  erb(:home)
end

get('/word/:id') do
  word = WordModule::Word.find(params[:id])
  binding.pry
  @word_name = word.word_name
  # @definitions = word.definition_list.push(params[:id])
  erb(:word)
end
