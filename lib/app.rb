# -*- encoding: utf-8 -*-
require 'base64'

class App < Sinatra::Base
  configure do
    set :root, File.expand_path('../../', __FILE__)

    use Rack::Auth::Basic do |username, password|
      username == ENV['BASIC_AUTH_USERNAME'] && password == ENV['BASIC_AUTH_PASSWORD']
    end
  end

  configure :development do
    Bundler.require :development
    register Sinatra::Reloader
  end

  get '/' do
    command = 'ipvsadm -Ln'
    @command_result = `#{command}`

    @refresh_seconds = 4 #(秒)

    erb :status
  end
end
