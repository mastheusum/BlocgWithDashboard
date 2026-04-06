require 'sinatra'
require 'json'

# revisar depois
class UserController < Sinatra::Base
  get '/user' do
    { message: 'THis route is only a test in UserController' }.to_json
  end

  post '/user' do
    data = JSON.parse request.body.read
    user = User.new(data)
    if user.save!
      status 201
      { user: user.username, message: 'Usuário cadastrado com sucesso!' }.to_json
    else
      status 422
      { message: 'Dados inválidos' }.to_json
    end
  end

  put '/user/:id' do
    id = params['id']
    data = JSON.parse request.body.read
    token = data[:auth_token]
    
    data.delete(:auth_token)
    
    session = Session.where(user_id: id)
    if session.auth_token == token
      user = User.find(id)
      if user.update(data)
        status 202
        { user: user.username, auth_token: token,message: 'Dados atualizados com sucesso!' }.to_json
      else
        status 422
        { message: 'Dados inválidos' }.to_json
      end
    else
      status 404
      { message: 'Acesso não autorizado' }.to_json
    end
  end
end
