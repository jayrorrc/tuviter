require "rails_helper"

include Devise::TestHelpers

RSpec.describe PostsController, :type => :controller do
    describe "GET #index" do
        it "this return only posts of user when login" do
            user = User.create!(:name => "Fulano", :email => "fulano@test.com", :password => "12345678")

            post1 = Post.create!(:title => "test1", :description => "test1", :user_id => user.id)
            post2 = Post.create!(:title => "test2", :description => "test2", :user_id => user.id)

            friend1 = User.create!(:name => "Sicrano", :email => "sicrano@test.com", :password => "12345678")
            friend2 = User.create!(:name => "Beltrano", :email => "beltrano@test.com", :password => "12345678")

            friendship = Friendship.create!(:user_id => user.id, :friend_id => friend1.id)
            friendship = Friendship.create!(:user_id => user.id, :friend_id => friend2.id)

            post3 = Post.create!(:title => "test3", :description => "test3", :user_id => friend1.id)
            post4 = Post.create!(:title => "test4", :description => "test4", :user_id => friend2.id)

            # Login with User user
            @request.env["devise.mapping"] = Devise.mappings[:user]
            sign_in user

            get :index

            expect(assigns(:posts)).to match_array([post1, post2])
        end

        it "this return all post when logout" do
            user = User.create!(:name => "Fulano", :email => "fulano@test.com", :password => "12345678")

            post1 = Post.create!(:title => "test1", :description => "test1", :user_id => user.id)
            post2 = Post.create!(:title => "test2", :description => "test2", :user_id => user.id)

            friend1 = User.create!(:name => "Sicrano", :email => "sicrano@test.com", :password => "12345678")
            friend2 = User.create!(:name => "Beltrano", :email => "beltrano@test.com", :password => "12345678")

            friendship = Friendship.create!(:user_id => user.id, :friend_id => friend1.id)
            friendship = Friendship.create!(:user_id => user.id, :friend_id => friend2.id)

            post3 = Post.create!(:title => "test3", :description => "test3", :user_id => friend1.id)
            post4 = Post.create!(:title => "test4", :description => "test4", :user_id => friend2.id)

            # Login and logout with User user to pass authenticate
            @request.env["devise.mapping"] = Devise.mappings[:user]
            sign_in user
            sign_out user

            get :index

            expect(assigns(:posts)).to match_array([post1, post2, post3, post4])
        end
    end
end
