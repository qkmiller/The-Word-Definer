
require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('pry')
require('language_filter')
require('./lib/filter')

@@list = []
get('/') do
  @@list = []
  WordModule::Word.clear
  erb(:home)
end

post('/word-list') do
  word = WordModule::Word.new(params.fetch("word"))
  definition = params.fetch("definition")
  if filter(word.word_name)
  else
    if filter(definition)
    else
      if params.fetch("definition") == ""
      else
        word.definition_list.push(definition)
      end
    end
    word.save

    @@list.push(word)
    @@list = @@list.sort_by {|obj| obj.word_name}
  end
  erb(:home)
end

get('/word-list') do
  erb(:home)
end

get('/word/:id') do
  @word = WordModule::Word.find(params[:id])
  erb(:word)
end
post('/word/:id') do
  @word = WordModule::Word.find(params[:id])
  definition = params.fetch("definition")
  if filter(definition)
  else
    if params.fetch("definition") == ""
    else
      @word.definition_list.push(params.fetch("definition"))
    end
  end
  erb(:word)
end
