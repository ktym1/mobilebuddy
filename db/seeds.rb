# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#creating the contracts(carriers)
Contract.create(name: "Rogers")
Contract.create(name: "Bell")
Contract.create(name: "Virgin")

#creating the devices
galaxy_5 = Device.create(name: "Galaxy",model:"S5", active: true)
iphone_5s = Device.create(name: "Iphone",model:"5S", active: true)
iphone_5c = Device.create(name: "Iphone", model:"5C", active: true)
note3 = Device.create(name: "Galaxy", model: "Note 3", active: true)
galaxy_4 = Device.create(name: "Galaxy", model:"s4", active: true)
galaxy_4_mini = Device.create(name: "Galaxy", model:"S4 mini", active: true)
htc8_m8 = Device.create(name: "HTC", model: "ONE M8", active: true)
nexus_5 = Device.create(name: "Nexus", model: "5", active: true)
xperia_z1 = Device.create(name: "Xperia", model: "Z1", active: true)
moto_g = Device.create(name: "Moto", model: "G", active: true)
galaxy_3 = Device.create(name: "Galaxy", model: "S3", active: true)
galaxy_ace2 = Device.create(name: "Galaxy", model: "Ace II x",active: true)
htc_desire = Device.create(name: "HTC", model: "Desire", active: true)

retailer = Retailer.create(name: "Rogers", website: "www.rogers.com")
Metadata.create(device_id: galaxy_5.id, retailer_id: retailer.id, detail: "GS5WHT")
Metadata.create(device_id: note3.id, retailer_id: retailer.id, detail: "NOTE3BLK")
Metadata.create(device_id: galaxy_4.id, retailer_id: retailer.id, detail: "GS416BLK")
Metadata.create(device_id: galaxy_4_mini.id, retailer_id: retailer.id, detail: "GS4MINIWHT")
Metadata.create(device_id: iphone_5c.id, retailer_id: retailer.id, detail: "IP5C16GRN")
Metadata.create(device_id: htc8_m8.id, retailer_id: retailer.id, detail: "ONEGRY")
Metadata.create(device_id: nexus_5.id, retailer_id: retailer.id, detail: "NEXUS5BLK")
Metadata.create(device_id: xperia_z1.id, retailer_id: retailer.id, detail: "XPERIAZ1PUR")
# 16 GB
Metadata.create(device_id: iphone_5s.id, retailer_id: retailer.id, detail: "IP5S16SIL")
# 32 GB
# Metadata.create(device_id: dev.id, retailer_id: retailer.id, detail: "IP5S32GRY")
# 64 GB
# Metadata.create(device_id: dev.id, retailer_id: retailer.id, detail: "IP5S64GRY")


bell = Retailer.create(name: "Bell", website: "www.bell.ca")
Metadata.create(device_id: iphone_5s.id, retailer_id: bell.id, detail: "http://www.bell.ca/mobility/products/apple-iphone-5s")
Metadata.create(device_id: iphone_5c.id, retailer_id: bell.id, detail: "http://www.bell.ca/Mobility/Products/Apple-iPhone-5c")
Metadata.create(device_id: galaxy_4_mini.id, retailer_id: bell.id, detail: "http://www.bell.ca/Mobility/Products/Samsung-Galaxy-S4-mini")
Metadata.create(device_id: galaxy_5.id, retailer_id: bell.id, detail: "http://www.bell.ca/Mobility/Products/Samsung-Galaxy-S5")
Metadata.create(device_id: note3.id, retailer_id: bell.id, detail: "http://www.bell.ca/Mobility/Products/Samsung-Galaxy-Note-3")
Metadata.create(device_id: galaxy_4.id, retailer_id: bell.id, detail: "http://www.bell.ca/Mobility/Products/Samsung-Galaxy-S4")
Metadata.create(device_id: htc8_m8.id, retailer_id: bell.id, detail: "http://www.bell.ca/Mobility/Products/the-all-new-HTC-One")
Metadata.create(device_id: nexus_5.id, retailer_id: bell.id, detail: "http://www.bell.ca/Mobility/Products/Nexus-5")
Metadata.create(device_id: xperia_z1.id, retailer_id: bell.id, detail: "http://www.bell.ca/Mobility/Products/Sony-Xperia-Z")

wave = Retailer.create(name: "Wireless Wave", website: "http://www.wirelesswave.ca")

Metadata.create(device_id: iphone_5s.id, retailer_id: wave.id, detail: "http://www.wirelesswave.ca/bell-apple-iphones/phone.asp?Phone=612")
Metadata.create(device_id: galaxy_5.id, retailer_id: wave.id, detail: "http://www.wirelesswave.ca/bell-phones-and-smartphones/phone.asp?Phone=681")
Metadata.create(device_id: note3.id, retailer_id: wave.id, detail: "http://www.wirelesswave.ca/bell-phones-and-smartphones/phone.asp?Phone=623")
Metadata.create(device_id: galaxy_4.id, retailer_id: wave.id, detail: "http://www.wirelesswave.ca/bell-phones-and-smartphones/phone.asp?Phone=538")
Metadata.create(device_id: galaxy_4_mini.id, retailer_id: wave.id, detail: "http://www.wirelesswave.ca/bell-phones-and-smartphones/phone.asp?Phone=629")
Metadata.create(device_id: iphone_5c.id, retailer_id: wave.id, detail: "http://www.wirelesswave.ca/bell-apple-iphones/phone.asp?Phone=603")
Metadata.create(device_id: htc8_m8.id, retailer_id: wave.id, detail: "http://www.wirelesswave.ca/bell-phones-and-smartphones/phone.asp?Phone=679")
Metadata.create(device_id: nexus_5.id, retailer_id: wave.id, detail: "http://www.wirelesswave.ca/bell-phones-and-smartphones/phone.asp?Phone=648")
Metadata.create(device_id: xperia_z1.id, retailer_id: wave.id, detail: "http://www.wirelesswave.ca/bell-phones-and-smartphones/phone.asp?Phone=636")

Metadata.create(device_id: galaxy_5.id, retailer_id: wave.id, detail: "http://www.wirelesswave.ca/rogers-phones-and-smartphones/phone.asp?Phone=683")
Metadata.create(device_id: iphone_5s.id, retailer_id: wave.id, detail: "http://www.wirelesswave.ca/rogers-apple-iphones/phone.asp?Phone=606")
Metadata.create(device_id: note3.id, retailer_id: wave.id, detail: "http://www.wirelesswave.ca/rogers-phones-and-smartphones/phone.asp?Phone=624")
Metadata.create(device_id: galaxy_4.id, retailer_id: wave.id, detail: "http://www.wirelesswave.ca/rogers-phones-and-smartphones/phone.asp?Phone=534")
Metadata.create(device_id: galaxy_4_mini.id, retailer_id: wave.id, detail: "http://www.wirelesswave.ca/rogers-phones-and-smartphones/phone.asp?Phone=630")
Metadata.create(device_id: iphone_5c.id, retailer_id: wave.id, detail: "http://www.wirelesswave.ca/rogers-apple-iphones/phone.asp?Phone=599")
Metadata.create(device_id: htc8_m8.id, retailer_id: wave.id, detail: "http://www.wirelesswave.ca/rogers-phones-and-smartphones/phone.asp?Phone=678")
Metadata.create(device_id: nexus_5.id, retailer_id: wave.id, detail: "http://www.wirelesswave.ca/rogers-phones-and-smartphones/phone.asp?Phone=657")
Metadata.create(device_id: xperia_z1.id, retailer_id: wave.id, detail: "http://www.wirelesswave.ca/rogers-phones-and-smartphones/phone.asp?Phone=635")

virgin = Retailer.create(name: "Virgin", website: "http://www.virginmobile.ca/")

#the URL end "SP9" refers to device price, deoending on the rate plan selection. 
#e.g. SP7 = Device price on Silver plans, SP8 = Device price on Gold plans, SP9 = Device price on Platinum plans
#note premium phones iphones & GS5 are only available on Platinum plans
Metadata.create(device_id: iphone_5s.id, retailer_id: virgin.id, detail: "http://www.virginmobile.ca/en/phones/phone-details.html?model=iphone5s&colour=Gold&memory=16&contractTerm=SP9")
Metadata.create(device_id: iphone_5c.id, retailer_id: virgin.id, detail: "http://www.virginmobile.ca/en/phones/phone-details.html?model=iphone5c&colour=Blue&memory=16&contractTerm=SP9")
Metadata.create(device_id: galaxy_5.id, retailer_id: virgin.id, detail: "http://www.virginmobile.ca/en/phones/phone-details.html?model=galaxys5&colour=White&contractTerm=SP9")
Metadata.create(device_id: galaxy_4.id, retailer_id: virgin.id, detail: "http://www.virginmobile.ca/en/phones/phone-details.html?model=galaxys4&colour=Red&contractTerm=SP9")
Metadata.create(device_id: nexus_5.id, retailer_id: virgin.id, detail: "http://www.virginmobile.ca/en/phones/phone-details.html?model=nexus5&colour=Black&contractTerm=SP9")
Metadata.create(device_id: moto_g.id, retailer_id: virgin.id, detail: "http://www.virginmobile.ca/en/phones/phone-details.html?model=motog&colour=Black&contractTerm=SP7")
Metadata.create(device_id: galaxy_3.id, retailer_id: virgin.id, detail: "http://www.virginmobile.ca/en/phones/phone-details.html?model=galaxysIII&colour=Blue&memory=16&contractTerm=SP8")
Metadata.create(device_id: galaxy_ace2, retailer_id: virgin.id, detail: "http://www.virginmobile.ca/en/phones/phone-details.html?model=samsungace&colour=Black&contractTerm=SP7")
Metadata.create(device_id: htc_desire, retailer_id: virgin.id, detail: "http://www.virginmobile.ca/en/phones/phone-details.html?model=htcdesire601&colour=Black&contractTerm=SP8")


