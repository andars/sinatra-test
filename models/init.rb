require 'sequel'
DB = Sequel.connect('sqlite://database.db')
require_relative 'users'
require_relative 'files'
