# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
['csv', 'open-uri'].each { |lib| require lib }

Airport.delete_all
Flight.delete_all

puts "Getting airport data..."
airport_data = open("http://ourairports.com/data/airports.csv")
airports_added = 0

CSV.parse(airport_data, headers:true) do |row|

  if row['iata_code']
    Airport.create(code:row['iata_code'])
    $stdout.flush
    airports_added += 1
    print "Created airport #{row['iata_code']} #{airports_added} airports added\r"
  end

  if airports_added > 100
    $stdout.flush
    puts "Added #{airports_added} airport(s)"
    break
  end
end

puts "Finished adding airports"

puts "Adding flights..."
50.times do |i|
  Flight.create(
      to_airport_id:i+1,
      from_airport_id:i+2,
      datetime:DateTime.now+i.hours.to_i,
      duration:i.minutes.to_i)
end
puts "Finished adding flights"
