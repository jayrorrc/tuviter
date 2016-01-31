class HomeController < ApplicationController
    def show
        if user_signed_in?
            @posts = []
            
            # All relationship of current user
            friends = Friendship.where(:user_id => current_user.id)
            friends.each do |friend|
            
                # All posts to every friend of currente user
                friends_posts = Post.where(:user_id => friend.friend_id)
                friends_posts.each do |post|
                    @posts << post
                end
                
            end
        else
            @posts = Post.all
        end
    end
end
