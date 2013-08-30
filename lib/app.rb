# -*- encoding: utf-8 -*-
require 'base64'

class App < Sinatra::Base
  configure do
    set :root, File.expand_path('../../', __FILE__)

    use Rack::Auth::Basic do |username, password|
      username == ENV['BASIC_AUTH_USERNAME'] && password == ['BASIC_AUTH_PASSWORD']
    end
  end

  configure :development do
    Bundler.require :development
    register Sinatra::Reloader
  end

  get '/' do
    @command_result = `ipvsadm -Ln`
    erb :status
  end
end
