require 'sinatra'
require 'sinatra/reloader'
require 'tilt/erubis'
require 'redcarpet'

root = File.expand_path("..", __FILE__)

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
    render_markdown(content) if ext == ".md"

    # case ext
    # when ".txt"
    #   render_txt(content)
    # when ".md"
    #   render_markdown(content)
    # end
  end
end

get "/" do
  @files = Dir[root + "/data/*"].map do |file|
    File.basename(file)
  end

  erb :index
end

get "/:file" do
  file_path = root + "/data/" + params[:file]

  if File.file?(file_path)
    load_file_content(file_path)
  else
    session[:error] = "#{params[:file]} does not exist."
    redirect "/"
  end
end
