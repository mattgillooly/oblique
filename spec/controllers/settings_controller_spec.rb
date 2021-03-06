require 'spec_helper'

describe SettingsController do

  include_context "logged-in user"

  it "gets the current user's settings" do
    settings = stub(:settings, as_json: 'foo')
    current_user.stub(:settings).and_return(settings)

    get 'show', format: :json

    response.should be_success
    assigns(:settings).should == settings
  end

  it "returns http success" do
    current_user.should_receive(:settings=).with do |settings|
      settings.tweet_hourly == true
    end

    current_user.should_receive(:save!)

    post 'create',
         tweet_hourly: true,
         format: :json

    response.should be_success
  end

end
