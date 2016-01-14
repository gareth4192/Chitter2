class Peep
  include DataMapper::Resource
  property :id,    Serial
  property :peep, String
  property :name, String
  property :time, String
end
