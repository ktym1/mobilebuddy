# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Contract.create(name: "Rogers")
Contract.create(name: "Bell")

dev = Device.create(name: "Galaxy",model:"s5")
retailer = Retailer.create(name: "Rogers", website: "www.rogers.com")
Metadata.create(device_id: dev.id, retailer_id: retailer.id, detail: "GS5WHT")

dev = Device.create(name: "Iphone",model:"5s")
# 16 GB
Metadata.create(device_id: dev.id, retailer_id: retailer.id, detail: "IP5S16SIL")
# 32 GB
Metadata.create(device_id: dev.id, retailer_id: retailer.id, detail: "IP5S32GRY")
# 64 GB
Metadata.create(device_id: dev.id, retailer_id: retailer.id, detail: "IP5S64GRY")

Retailer.create(name: "Bell", website: "www.bell.ca")



