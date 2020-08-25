puts 'Seeding Database....'
puts ''
puts 'Creating User Profiles'

User.destroy_all

u1 = User.create! email: 'chris@ga.com', password: 'chicken', name: 'Chris', admin: true
u2 = User.create! email: 'robbie@ga.com', password: 'chicken', name: 'Robbie', admin: true
u3 = User.create! email: 'luke@ga.com', password: 'chicken', name: 'Luke', admin: false
u4 = User.create! email: 'zara@ga.com', password: 'chicken', name: 'Zara', admin: false

puts "Created #{User.count} users: "
puts User.pluck(:name).join(', ')

puts ''
puts 'Creating Airplanes...'

Airplane.destroy_all

a1 = Airplane.create! name: '747', rows: 50, columns: 6
a2 = Airplane.create! name: '767', rows: 40, columns: 6
a3 = Airplane.create! name: 'A380', rows: 70, columns: 10
a4 = Airplane.create! name: 'A220', rows: 20, columns: 4
a5 = Airplane.create! name: '717', rows: 30, columns: 6
a6 = Airplane.create! name: '787', rows: 50, columns: 10

puts "Created #{Airplane.count} airplanes: "
puts Airplane.pluck(:name).join(', ')

puts ''
puts 'Creating Airports...'

Airport.destroy_all

airport1 = Airport.create! name: 'Sydney', code: 'SYD'
airport2 = Airport.create! name: 'Melbourne', code: 'MEL'
airport3 = Airport.create! name: 'Brisbane', code: 'BNE'
airport4 = Airport.create! name: 'Hobart', code: 'HBA'
airport5 = Airport.create! name: 'Perth', code: 'PER'
airport6 = Airport.create! name: 'Darwin', code: 'DRW'
airport7 = Airport.create! name: 'Adelaide', code: 'ADL'
airport8 = Airport.create! name: 'Newcastle', code: 'NTL'

puts "Created #{Airport.count} airports: "
puts Airport.pluck(:name).join(', ')


Flight.destroy_all

puts ''
puts 'Creating Flights...'

flight1 = Flight.create! flight_number: 12, origin: 'SYD', destination: 'MEL', date: '25-08-2020'
flight2 = Flight.create! flight_number: 24, origin: 'PER', destination: 'SYD', date: '28-09-2020'
flight3 = Flight.create! flight_number: 456, origin: 'DRW', destination: 'ADL', date: '15-02-2021'
flight4 = Flight.create! flight_number: 543, origin: 'BNE', destination: 'NTL', date: '23-09-2020'

puts "Created #{Flight.count} flights: "
puts Flight.pluck(:flight_number).join(', ')

puts ''
puts 'Assigning flights to airplanes'
a1.flights << flight1 << flight2
a3.flights << flight3
a5.flights << flight4


puts ''
puts 'Assigning users to flights'


flight1.users << u1 << u2 << u4
flight2.users << u3 << u4
