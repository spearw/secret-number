require 'sinatra'
require 'sinatra/reloader'


number = rand(101)

get '/frank-says' do
    erb :index, :locals => {:number => number}
end

