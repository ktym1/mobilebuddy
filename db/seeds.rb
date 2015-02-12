# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#creating the contracts(carriers)
Contract.create(name: "Bell")
Contract.create(name: "Telus")

#creating the devices
galaxy_5 = Device.create(name: "Galaxy",model:"S5", active: true)
galaxy_4 = Device.create(name: "Galaxy", model:"S4", active: true)
note_3 = Device.create(name: "Galaxy", model: "Note 3", active: true)
nexus_6 = Device.create(name: "Nexus", model:"6", active: true)

#Create the retailer & metadata
bell = Retailer.create(name: "Bell")
Metadata.create(device_id: galaxy_5.id, retailer_id: bell.id, detail: "http://www.bell.ca/Mobility/Products/Samsung-Galaxy-S5")
Metadata.create(device_id: galaxy_4.id, retailer_id: bell.id, detail: "http://www.bell.ca/Mobility/Products/Samsung-Galaxy-S4")
Metadata.create(device_id: nexus_6.id, retailer_id: bell.id, detail: "http://www.bell.ca/Mobility/Products/Nexus-6")

telus = Retailer.create(name: "Telus")
Metadata.create(device_id: galaxy_5.id, retailer_id: telus.id, detail: "http://www.telus.com/en/on/mobility/devices/samsung-galaxy-s5/?INTCMP=BetaCatalogCard_samsung-galaxy-s5_CTA_ToDetails")
Metadata.create(device_id: galaxy_4.id, retailer_id: telus.id, detail: "http://www.telus.com/en/on/mobility/devices/samsung-galaxy-s4/?INTCMP=BetaCatalogCard_samsung-galaxy-s4_CTA_ToDetails")
Metadata.create(device_id: note_3.id, retailer_id: telus.id, detail: "http://www.telus.com/en/on/mobility/devices/samsung-galaxy-note-3/?INTCMP=BetaCatalogCard_samsung-galaxy-note-3_CTA_ToDetails")
Metadata.create(device_id: nexus_6.id, retailer_id: telus.id, detail: "http://www.telus.com/en/on/mobility/devices/nexus-6/?INTCMP=BetaCatalogCard_nexus-6_CTA_ToDetails")

wave = Retailer.create(name: "Wireless Wave")
#Bell 
Metadata.create(device_id: galaxy_5.id, retailer_id: wave.id, detail: "http://www.wirelesswave.ca/bell-phones-and-smartphones/phone.asp?Phone=681")
Metadata.create(device_id: galaxy_4.id, retailer_id: wave.id, detail: "http://www.wirelesswave.ca/bell-phones-and-smartphones/phone.asp?Phone=538")
Metadata.create(device_id: note_3.id, retailer_id: wave.id, detail: "http://www.wirelesswave.ca/bell-phones-and-smartphones/phone.asp?Phone=623")
Metadata.create(device_id: nexus_5.id, retailer_id: wave.id, detail: "http://www.wirelesswave.ca/bell-phones-and-smartphones/phone.asp?Phone=648")





# retailer = Retailer.create(name: "Rogers", website: "www.rogers.com")
# Metadata.create(device_id: galaxy_5.id, retailer_id: retailer.id, detail: "GS5WHT")
# Metadata.create(device_id: note3.id, retailer_id: retailer.id, detail: "NOTE3BLK")
# Metadata.create(device_id: galaxy_4.id, retailer_id: retailer.id, detail: "GS416BLK")
# Metadata.create(device_id: galaxy_4_mini.id, retailer_id: retailer.id, detail: "GS4MINIWHT")
# Metadata.create(device_id: iphone_5c.id, retailer_id: retailer.id, detail: "IP5C16GRN")
# Metadata.create(device_id: htc8_m8.id, retailer_id: retailer.id, detail: "ONEGRY")
# Metadata.create(device_id: nexus_5.id, retailer_id: retailer.id, detail: "NEXUS5BLK")
# Metadata.create(device_id: xperia_z1.id, retailer_id: retailer.id, detail: "XPERIAZ1PUR")
# 16 GB
# Metadata.create(device_id: iphone_5s.id, retailer_id: retailer.id, detail: "IP5S16SIL")
# 32 GB
# Metadata.create(device_id: dev.id, retailer_id: retailer.id, detail: "IP5S32GRY")
# 64 GB
# Metadata.create(device_id: dev.id, retailer_id: retailer.id, detail: "IP5S64GRY")



# virgin = Retailer.create(name: "Virgin", website: "http://www.virginmobile.ca/")

#the URL end "SP9" refers to device price, deoending on the rate plan selection. 
#e.g. SP7 = Device price on Silver plans, SP8 = Device price on Gold plans, SP9 = Device price on Platinum plans
#note premium phones iphones & GS5 are only available on Platinum plans
# Metadata.create(device_id: iphone_5s.id, retailer_id: virgin.id, detail: "http://www.virginmobile.ca/en/phones/phone-details.html?model=iphone5s&colour=Gold&memory=16&contractTerm=SP9")
# Metadata.create(device_id: iphone_5c.id, retailer_id: virgin.id, detail: "iphone5c&colour=Blue&memory=16&contractTerm=SP8")
# Metadata.create(device_id: galaxy_5.id, retailer_id: virgin.id, detail: "http://www.virginmobile.ca/en/phones/phone-details.html?model=galaxys5&colour=White&contractTerm=SP9")
# Metadata.create(device_id: galaxy_4.id, retailer_id: virgin.id, detail: "http://www.virginmobile.ca/en/phones/phone-details.html?model=galaxys4&colour=Red&contractTerm=SP9")
# Metadata.create(device_id: nexus_5.id, retailer_id: virgin.id, detail: "http://www.virginmobile.ca/en/phones/phone-details.html?model=nexus5&colour=Black&contractTerm=SP9")
# Metadata.create(device_id: moto_g.id, retailer_id: virgin.id, detail: "http://www.virginmobile.ca/en/phones/phone-details.html?model=motog&colour=Black&contractTerm=SP7")
# Metadata.create(device_id: galaxy_3.id, retailer_id: virgin.id, detail: "http://www.virginmobile.ca/en/phones/phone-details.html?model=galaxysIII&colour=Blue&memory=16&contractTerm=SP8")
# Metadata.create(device_id: galaxy_ace2, retailer_id: virgin.id, detail: "http://www.virginmobile.ca/en/phones/phone-details.html?model=samsungace&colour=Black&contractTerm=SP7")
# Metadata.create(device_id: htc_desire, retailer_id: virgin.id, detail: "http://www.virginmobile.ca/en/phones/phone-details.html?model=htcdesire601&colour=Black&contractTerm=SP8")

# Fido
# fido = Retailer.create(name: "Fido", website: "www.fido.ca")
# Metadata.create(device_id: iphone_5s.id, retailer_id: fido.id, detail: "http://www.fido.ca/web/page/portal/Fido/iPhones#iphone5s_tab")
# Metadata.create(device_id: galaxy_5.id, retailer_id: fido.id, detail: "http://www.fido.ca/web/page/portal/Fido/devices?PhoneSKU=GS5WHT")
# Metadata.create(device_id: galaxy_4.id, retailer_id: fido.id, detail: "http://www.fido.ca/web/page/portal/Fido/devices?PhoneSKU=GS416BLK")
# Metadata.create(device_id: galaxy_4_mini.id, retailer_id: fido.id, detail: "http://www.fido.ca/web/page/portal/Fido/devices?PhoneSKU=GS4MINIWHT")
# Metadata.create(device_id: iphone_5c.id, retailer_id: fido.id, detail: "http://www.fido.ca/web/page/portal/Fido/iPhones#iphone5c_tab")
# Metadata.create(device_id: nexus_5.id, retailer_id: fido.id, detail: "http://www.fido.ca/web/page/portal/Fido/devices?PhoneSKU=NEXUS5BLK")
# Metadata.create(device_id: htc_desire.id, retailer_id: fido.id, detail: "http://www.fido.ca/web/page/portal/Fido/devices?PhoneSKU=DESIREWHT")
