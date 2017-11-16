require 'sinatra'
require "sinatra/reloader" if development?

require_relative './controllers/garden_controller.rb'

run FoodControl
