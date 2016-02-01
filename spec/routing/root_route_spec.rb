require 'rails_helper'

RSpec.describe "routing to root path", :type => :routing do
    it "routes / to home#show" do
        expect(:get => "/").to route_to(
            :controller => "home",
            :action => "show"
        )
    end
end
