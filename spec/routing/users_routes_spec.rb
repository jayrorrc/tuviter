require 'rails_helper'

RSpec.describe "routing to users", :type => :routing do
    it "routes /users to posts#new" do
        expect(:get => "/users").to route_to(
            :controller => "users",
            :action => "index"
        )
    end

    it "routes /perfil/:id to posts#new" do
        expect(:get => "/perfil/1").to route_to(
            :controller => "users",
            :action => "show",
            :id => "1"
        )
    end

     it "routes /perfil/edit/:id to posts#new" do
        expect(:get => "/perfil/edit/1").to route_to(
            :controller => "users",
            :action => "edit",
            :id => "1"
        )
    end
end
