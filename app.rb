
require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/Word')
require('pry')

@@word_list = []

get('/') do
  @@word_list = []
  erb(:home)
end

post('/') do
  word = WordModule::Word.new(params.fetch("word"))
  @@word_list.push(word)
  erb(:home)
end

get('/word/:id') do
  erb(:word)
end
