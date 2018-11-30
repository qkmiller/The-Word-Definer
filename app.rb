
require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/Class')
require('pry')

get('/') do
  erb(:input)
end
