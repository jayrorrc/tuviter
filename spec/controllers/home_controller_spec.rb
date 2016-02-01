require "rails_helper"

include Devise::TestHelpers

RSpec.describe HomeController, :type => :controller do
    describe "GET #show" do
        it "this return only friend's post when login" do
            user1 = User.create!(:name => "Fulano1", :email => "fulano1@test.com", :password => "12345678")
            user2 = User.create!(:name => "Fulano2", :email => "fulano2@test.com", :password => "12345678")
            user3 = User.create!(:name => "Fulano3", :email => "fulano3@test.com", :password => "12345678")

            friend1 = User.create!(:name => "Sicrano", :email => "sicrano@test.com", :password => "12345678")
            friend2 = User.create!(:name => "Beltrano", :email => "beltrano@test.com", :password => "12345678")

            Friendship.create!(:user_id => user1.id, :friend_id => friend1.id)
            Friendship.create!(:user_id => user1.id, :friend_id => friend2.id)

            Friendship.create!(:user_id => user2.id, :friend_id => friend1.id)
            Friendship.create!(:user_id => user3.id, :friend_id => friend2.id)

            Friendship.create!(:user_id => friend1.id, :friend_id => user1.id)
            Friendship.create!(:user_id => friend2.id, :friend_id => user1.id)

            post1 = Post.create!(:title => "test1", :description => "test1", :user_id => user1.id)
            post2 = Post.create!(:title => "test2", :description => "test2", :user_id => user1.id)

            post3 = Post.create!(:title => "test3", :description => "test3", :user_id => friend1.id)
            post4 = Post.create!(:title => "test4", :description => "test4", :user_id => friend2.id)

            post5 = Post.create!(:title => "test5", :description => "test5", :user_id => user2.id)
            post6 = Post.create!(:title => "test6", :description => "test6", :user_id => user3.id)

            # Login with User user
            @request.env["devise.mapping"] = Devise.mappings[:user]
            sign_in user1

            get :show

            expect(assigns(:posts)).to match_array([post3, post4])
        end

        it "this return all post when logout" do
            user1 = User.create!(:name => "Fulano1", :email => "fulano1@test.com", :password => "12345678")

            user2 = User.create!(:name => "Fulano2", :email => "fulano2@test.com", :password => "12345678")
            user3 = User.create!(:name => "Fulano3", :email => "fulano3@test.com", :password => "12345678")

            friend1 = User.create!(:name => "Sicrano", :email => "sicrano@test.com", :password => "12345678")
            friend2 = User.create!(:name => "Beltrano", :email => "beltrano@test.com", :password => "12345678")

            Friendship.create!(:user_id => user1.id, :friend_id => friend1.id)
            Friendship.create!(:user_id => user1.id, :friend_id => friend2.id)

            post1 = Post.create!(:title => "test1", :description => "test1", :user_id => user1.id)
            post2 = Post.create!(:title => "test2", :description => "test2", :user_id => user1.id)

            post3 = Post.create!(:title => "test3", :description => "test3", :user_id => friend1.id)
            post4 = Post.create!(:title => "test4", :description => "test4", :user_id => friend2.id)

            post5 = Post.create!(:title => "test5", :description => "test5", :user_id => user2.id)
            post6 = Post.create!(:title => "test6", :description => "test6", :user_id => user3.id)

            # Login and logout with User user to pass authenticate
            @request.env["devise.mapping"] = Devise.mappings[:user]
            sign_in user1
            sign_out user1

            get :show

            expect(assigns(:posts)).to match_array([post1, post2, post3, post4, post5, post6])
        end
    end
end
