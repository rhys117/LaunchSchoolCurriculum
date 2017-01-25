require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"
require "yaml"

before do
  @file = YAML.load_file('users.yaml')
  @users = @file.keys
end

helpers do
  def count_interests(users)
    users.reduce(0) do |sum, (name, user)|
      sum + user[:interests].size
    end
  end
end

get '/' do
  redirect "/users"
end

get '/users' do
  @title = 'Users'

  erb :home
end

get '/users/:id' do
  @user = params[:id].to_sym
  @title = @user
  @email = @file[@user][:email]
  @interests = @file[@user][:interests]

  erb :user
end
