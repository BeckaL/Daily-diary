require 'sinatra/base'
require './lib/diary'

class App < Sinatra::Base

  before do
    @diary = Diary.create
  end

 get '/' do
   erb :index
 end

 get '/add_entry' do
   erb :add_entry
 end

 post '/add_entry' do
   @diary.add(params[:title], params[:text])
   redirect '/confirmation'
 end

 get '/confirmation' do
   erb :confirmation
 end

 get '/view_entries' do
   @titles = @diary.view_titles
   def redir
     redirect '/text'
   end
   erb :view_entries
 end

 get '/text' do
   "Did some stuff"
 end

 run! if app_file == $0


end
