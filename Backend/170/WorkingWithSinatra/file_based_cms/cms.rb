require 'sinatra'
require 'sinatra/reloader'
require 'erubis'

helpers do
  def remove_extentions(file)
    File.basename(file, ".*")
  end
end

get "/" do
  @files = Dir["data/*"].map do |file|
    File.basename(file)
  end

  erb :index
end

get "/:file" do
  file_path = "data/" + params[:file]

  headers["Content-Type"] = "text/plain"
  File.read(file_path)
end
