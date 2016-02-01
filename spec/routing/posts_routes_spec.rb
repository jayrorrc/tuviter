require 'rails_helper'

RSpec.describe "routing to posts", :type => :routing do
    it "routes /posts/new to posts#new" do
        expect(:get => "/posts/new").to route_to(
            :controller => "posts",
            :action => "new"
        )
    end

    it "routes /posts to posts#new" do
        expect(:get => "/posts").to route_to(
            :controller => "posts",
            :action => "index"
        )
    end
end
