
require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/Word')
require('pry')

@@list = []

get('/') do
  @@list = []
  WordModule::Word.clear
  erb(:home)
end

post('/word-list') do
  word = WordModule::Word.new(params.fetch("word"))
  word.save
  if params.fetch("definition") == ""
  else
    word.definition_list.push(params.fetch("definition"))
  end
  @@list.push(word)
  erb(:home)
end

get('/word-list') do
  erb(:home)
end

get('/word/:id') do
  @word = WordModule::Word.find(params[:id])
  @word_name = @word.word_name
  erb(:word)
end
post('/word/:id') do
  @word = WordModule::Word.find(params[:id])
  @word_name = @word.word_name
  if params.fetch("definition") == ""
  else
    @word.definition_list.push(params.fetch("definition"))
  end
  erb(:word)
end
