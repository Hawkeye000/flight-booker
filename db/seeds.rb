# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
['csv', 'open-uri'].each { |lib| require lib }

Airport.delete_all

airport_data = open("http://ourairports.com/data/airports.csv")

CSV.parse(airport_data, headers:true) do |row|
  Airport.create(code:row['iata_code'])
  if row['iata_code']
    $stdout.flush
    print "Created Airport #{row['iata_code']}\r"
  end
end
