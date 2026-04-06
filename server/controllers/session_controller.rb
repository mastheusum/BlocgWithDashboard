require 'sinatra'
require 'json'

class SessionController < Sinatra::Base
  get '/session' do
    { message: 'THis route is only a test in Session Controller' }.to_json
  end

  post '/session' do
  end

  delete '/session/:id' do
  end
end