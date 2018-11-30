
require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/Word')
require('pry')

@@word_list = []

get('/') do
  erb(:input)
end



get('/word/:id') do
  erb(:word)
end
