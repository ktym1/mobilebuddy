FactoryGirl.define do
  factory :summary do
    price 10.00
    retailer_id 2
    promotion_link "www.robford.com"
    device_id 1
    association :contract, factory: :contract
  end

  factory :contract do
    name "Bell"
  end
end