require 'spec_helper'

describe QuipsController do

  include_context "logged-in user"

  let(:quips) { stub(:quips, as_json: 'foo') }

  before do
    current_user.stub(:quips).and_return(quips)
  end

  it "lists quips" do
    get 'index', format: :json

    response.should be_success
    assigns(:quips).should == quips
  end

  it "creates a new quip" do
    attrs = { 'text' => "Hey buddy!" }

    quips.should_receive(:create).with(attrs).and_return(Quip.new)

    post 'create',
      quip: attrs,
      format: :json

    response.should be_success
  end

  it "fetches a quip" do
    quip_id = 4
    quip = stub(:quip, as_json: 'asdf')

    quips.stub(:find).with(quip_id.to_s).and_return(quip)

    get 'show',
      id: quip_id,
      format: :json

    response.should be_success
    assigns(:quip).should == quip
  end

end
