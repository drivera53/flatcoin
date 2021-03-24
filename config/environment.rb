ENV['SINATRA_ENV'] ||= "development"

require 'net/http'
require 'open-uri'
require 'json'
require 'tty-prompt'
require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])

ActiveRecord::Base.establish_connection(ENV['SINATRA_ENV'].to_sym)

require_all 'app'
