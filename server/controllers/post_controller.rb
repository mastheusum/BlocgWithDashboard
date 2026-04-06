require 'sinatra'
require 'json'
require_relative '../models/post'

class PostController < Sinatra::Base
  get '/post' do
    posts = Post.all
    status 200
    { posts: posts }.to_json
  end

  post '/post' do
    data = JSON.parse request.body.read
    post = Post.new(data)
    if post.save!
      status 201
      { post: post }.to_json
    else
      status 422
      { message: 'Invalid' }.to_json
    end
  end

  put '/post/:id' do
  end

  delete '/post/:id' do
  end
end