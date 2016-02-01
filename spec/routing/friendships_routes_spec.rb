require 'rails_helper'

RSpec.describe "routing to friendships", :type => :routing do
    it "routes /follow/:id to posts#new" do
        expect(:get => "/follow/1").to route_to(
            :controller => "friendships",
            :action => "create",
            :id => "1"
        )
    end

     it "routes /unfollow/:id to posts#new" do
        expect(:get => "/unfollow/1").to route_to(
            :controller => "friendships",
            :action => "destroy",
            :id => "1"
        )
    end
end
