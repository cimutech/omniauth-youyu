# Configure Rails Envinronment
ENV["RAILS_ENV"] ||= "test"
ENV["RAILS_ENV"] = "#{ ENV["RAILS_ENV"] }_#{ ENV['DB'] }" if ENV['DB']


require "rspec/rails"
require 'omniauth-youyu'

