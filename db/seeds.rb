# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

contract = Contract.create(name: "Bell")

dev = Device.create(name: "Iphone",model:"5s")

retailer = Retailer.create(name: "Test", website: "--")

Summary.create(price: 10.80, contract_id: contract.id, device_id: dev.id, retailer_id: retailer.id)