require 'sinatra'
require 'rack/cors'
require 'json'
require 'mongoid'

require_relative 'controllers/post_controller'
require_relative 'controllers/user_controller'
require_relative 'controllers/session_controller'

Mongoid.load!("config/mongoid.yml", :development)

use Rack::Cors do
  allow do
    origins '*'
    resource '*', headers: :any, methods: %i[:get :post :put :patch :delete :head :options]
  end
end

# set :bind, '127.0.0.1'
# set :port, 80

use PostController
use UserController
use SessionController