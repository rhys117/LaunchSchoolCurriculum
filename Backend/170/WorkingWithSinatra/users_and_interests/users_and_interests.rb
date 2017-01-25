require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"

get '/' do
  @title = "Users and Interests"

  erb :home
end