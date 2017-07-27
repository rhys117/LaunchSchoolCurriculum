require 'sinatra'
require 'sinatra/reloader'
require 'tilt/erubis'
require 'redcarpet'

SUPPORTED_FILETYPES = [".md", ".txt"]

def filetype_supported?(file)
  SUPPORTED_FILETYPES.include?(File.extname(file))
end

def data_path
  if ENV["RACK_ENV"] == 'test'
    File.expand_path("../test/data", __FILE__)
  else
    File.expand_path("../data", __FILE__)
  end
end

configure do
  enable :sessions
  set :session_secret, 'session secret key'
end

helpers do
  def remove_extentions(file)
    File.basename(file, ".*")
  end

  def render_markdown(file)
    markdown = Redcarpet:: Markdown.new(Redcarpet::Render::HTML)
    markdown.render(file)
  end

  def render_txt(content)
    headers["Content-Type"] = "text/plain"
    headers["Content"] = content
  end

  def load_file_content(path)
    content = File.read(path)
    ext = File.extname(path)

    return render_txt(content) if ext ==".txt"
    erb render_markdown(content) if ext == ".md"

    # case ext
    # when ".txt"
    #   render_txt(content)
    # when ".md"
    #   render_markdown(content)
    # end
  end
end

get "/" do
  pattern = File.join(data_path, "*")
  @files = Dir.glob(pattern).map do |file|
    File.basename(file)
  end

  erb :index
end

get "/new" do
  erb :new
end

post "/create" do
  file = params[:filename].to_s

  if file.size == 0
    session[:error] = "A name is required"
    status 422
    erb :new
  elsif filetype_supported?(file)
    file_path = File.join(data_path, file)

    File.write(file_path, "")
    session[:success] = "#{params[:filename]} has been created"

    redirect "/"
  else
    session[:error] = "Filetype not supported. Must be .txt or .md"
    status 422
    erb :new
  end
end

get "/:file" do
  file_path = File.join(data_path, params[:file])

  if File.file?(file_path)
    load_file_content(file_path)
  else
    session[:error] = "#{params[:file]} does not exist."
    redirect "/"
  end
end

get "/edit/:file" do
  file_path = File.join(data_path, params[:file])

  @filename = params[:file]
  @content = File.read(file_path)

  erb :edit
end

post "/delete/:file" do
  file_path = File.join(data_path, params[:file])

  File.delete(file_path)

  session["success"] = "#{params[:file]} has been deleted."
  redirect("/")
end

post "/:file" do
  file_path = File.join(data_path, params[:file])

  File.write(file_path, params[:content])

  session[:success] = "#{params[:file]} has been updated"
  redirect("/")
end
