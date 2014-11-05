# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# ['csv', 'open-uri'].each { |lib| require lib }
#
Airport.delete_all
Flight.delete_all
#
# puts "Getting airport data..."
# airport_data = open("http://ourairports.com/data/airports.csv")
# airports_added = 0
#
# CSV.parse(airport_data, headers:true) do |row|
#
#   if row['iata_code']
#     Airport.create(code:row['iata_code'])
#     $stdout.flush
#     airports_added += 1
#     print "Created airport #{row['iata_code']} #{airports_added} airports added\r"
#   end
#
#   if airports_added > 100
#     $stdout.flush
#     puts "Added #{airports_added} airport(s)"
#     break
#   end
# end
#
# puts "Finished adding airports"
#
# puts "Adding flights..."
# 50.times do |i|
#   Flight.create(
#       to_airport_id:i+1,
#       from_airport_id:i+2,
#       datetime:DateTime.now+i.hours.to_i,
#       duration:i.minutes.to_i)
# end
# puts "Finished adding flights"

# Add Airports
Airport.create(code:"SFO") # 1
Airport.create(code:"LAX") # 2
Airport.create(code:"JFK") # 3
Airport.create(code:"BOS") # 4
Airport.create(code:"DFW") # 5
Airport.create(code:"ORD") # 6
Airport.create(code:"ATL") # 7

# Add Flights

Flight.create(to_airport_id:1, from_airport_id:3,
              datetime:DateTime.new(2014,11,14,4,30),
              duration:6.hours)
Flight.create(to_airport_id:3, from_airport_id:1,
              datetime:DateTime.new(2014,11,20,16,30),
              duration:5.hours)
Flight.create(to_airport_id:5, from_airport_id:6,
              datetime:DateTime.new(2014,11,28,12,45),
              duration:(2.hours+30.minutes))
Flight.create(to_airport_id:7, from_airport_id:4,
              datetime:DateTime.new(2014,11,16,9,05),
              duration:3.hours)
Flight.create(to_airport_id:1, from_airport_id:2,
              datetime:DateTime.new(2014,11,20,18,30),
              duration:(1.hours+40.minutes))
Flight.create(to_airport_id:5, from_airport_id:4,
              datetime:DateTime.new(2014,11,10,11,45),
              duration:3.hours)
Flight.create(to_airport_id:2, from_airport_id:1,
              datetime:DateTime.new(2014,11,14,10,30),
              duration:(1.hours+40.minutes))
Flight.create(to_airport_id:1, from_airport_id:7,
              datetime:DateTime.new(2014,11,17,16,10),
              duration:(4.hours+55.minutes))
Flight.create(to_airport_id:7, from_airport_id:3,
              datetime:DateTime.new(2014,11,21,6,35),
              duration:6.hours)
