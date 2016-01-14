require 'data_mapper'
require 'dm-postgres-adapter'
require './app/models/peeps.rb'
require './app/models/user.rb'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
DataMapper.finalize
