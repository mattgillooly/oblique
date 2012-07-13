require 'spec_helper'

describe Quip do
  it "is invalid without a user" do
    FactoryGirl.build(:quip, user: nil).should_not be_valid
  end

  it "is invalid without text" do
    FactoryGirl.build(:quip, text: nil).should_not be_valid
  end
end
