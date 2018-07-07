# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#

Vehicle.create([
  { vin: '5TBBV54127S450582', mileage: 20_000, plate_state: 'WA' },
  { vin: 'WDBSK71F67F134208', mileage: 100_000, plate_state: 'CO' },
  { vin: '1C4BJWEG3CL118433', mileage: 78_000, plate_state: 'CO' }
])
