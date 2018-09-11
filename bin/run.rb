require_relative '../config/environment'

require 'pry'
require 'json'

file = File.read('./tools/sample_charmander_data.json')
charmander = JSON.parse(file)
binding.pry
