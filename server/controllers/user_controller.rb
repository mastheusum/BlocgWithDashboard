require 'sinatra'
require 'json'

class UserController < Sinatra::Base
  get '/user' do
    { message: 'THis route is only a test in UserController' }.to_json
  end

  post '/user' do
  end

  put '/user/:id' do
  end
end