require "rails_helper"

RSpec.describe UsersController, :type => :controller do
    describe "GET #index" do
        it "this return all users" do
            user1 = User.create!(:name => "Fulano", :email => "fulano@test.com", :password => "12345678")
            user2 = User.create!(:name => "Sicrano", :email => "sicrano@test.com", :password => "12345678")
            user3 = User.create!(:name => "Beltrano", :email => "beltrano@test.com", :password => "12345678")

            get :index
            expect(assigns(:users)).to match_array([user1, user2, user3])
        end
    end
end

RSpec.describe UsersController, :type => :controller do
    describe "GET #show" do
        it "this return the user and your posts and your friend" do
            user = User.create!(:name => "Fulano", :email => "fulano@test.com", :password => "12345678")

            post1 = Post.create!(:title => "test1", :description => "test1", :user_id => user.id)
            post2 = Post.create!(:title => "test2", :description => "test2", :user_id => user.id)

            friend1 = User.create!(:name => "Sicrano", :email => "sicrano@test.com", :password => "12345678")
            friend2 = User.create!(:name => "Beltrano", :email => "beltrano@test.com", :password => "12345678")

            friendship = Friendship.create!(:user_id => user.id, :friend_id => friend1.id)
            friendship = Friendship.create!(:user_id => user.id, :friend_id => friend2.id)

            get :show, :id => user.id

            expect(assigns(:user)).to eq(user)
            expect(assigns(:my_posts)).to match_array([post1, post2])
            expect(assigns(:my_friends)).to match_array([friend1, friend2])
        end
    end
end
