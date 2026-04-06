require 'sinatra'
require 'json'
require_relative '../models/post'

class PostController < Sinatra::Base
  get '/post' do
    { message: 'THis route is only a test in Post Controller' }.to_json
  end

  post '/post' do
  end

  put '/post/:id' do
  end

  delete '/post/:id' do
  end
end