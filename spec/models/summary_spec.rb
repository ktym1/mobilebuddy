require 'spec_helper'

describe Summary do
  before do
  	@summary = FactoryGirl.create :summary
  end

  it "should have a price" do
  	@summary.price.should be == 10.00
  end
  
end
