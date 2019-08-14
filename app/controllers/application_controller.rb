
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :index
  end
  
   get '/articles/new' do
    erb :new
  end
  
  get '/articles/:id' do
    id = params[:id]
    @article = Article.all.find{|a| a.id == id}
    erb :show
  end
  
  post '/articles' do
    @article = Article.create(title: params[:title], content: params[:content])
    erb :show
  end
  
  get '/articles/:id/edit' do
    erb :edit
  end
end
