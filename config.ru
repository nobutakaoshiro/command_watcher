$:.unshift File.join(File.dirname(__FILE__), 'lib')
require 'bundler'
Bundler.require

require 'app'
map '/status' do
  run App
end
