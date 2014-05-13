require 'spec_helper'

describe Summary do
  before do
  	@summary = FactoryGirl.create :summary
  end

  it{should be_valid}

  it{should respond_to(:device_id)}
  it{should respond_to(:retailer_id)}
  it{should respond_to(:contract_id)}

  it "should have a price" do
  	@summary.price.should be == 10.00
  end
 
end
