require 'sinatra'
require 'sinatra/reloader'


secret_number = rand(101)
message = ""

get '/frank-says' do
    guess = params["guess"]
    message = check_guess(guess, secret_number)
    if message == "You got it right!"
        win_message = "the SECRET NUMBER is #{secret_number}"
        erb :index, :locals => {:win_message => win_message, :message => message}
    else
        erb :index, :locals => {:win_message => win_message, :message => message}
    end
end

def check_guess(guess, secret_number)
    if (params["guess"].to_i - 5) > secret_number
        "WAY too high!"
    elsif (params["guess"].to_i + 5) < secret_number
        "WAY too low!"
    elsif params["guess"].to_i > secret_number
        "Too high!"
    elsif params["guess"].to_i < secret_number
        "Too low!"
    elsif params["guess"].to_i == secret_number
        "You got it right!"
    else
        false
    end
end

