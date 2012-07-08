shared_context "logged-in user" do

  let(:current_user) { stub(:user) }

  before do
    controller.stub(:current_user).and_return(current_user)
  end

end
