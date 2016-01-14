# ENV['RACK_ENV'] = 'development'
require 'sinatra/base'
require_relative 'data_mapper_setup'
class Chitter < Sinatra::Base
  get '/' do
    @peeps = Peep.all
    erb :'/index'
  end

  get '/peeps/new' do
    erb :'/peeps/new'
  end

  post '/peeps' do
    Peep.create(peep: params[:peep])
    redirect '/'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
