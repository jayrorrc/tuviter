class HomeController < ApplicationController
    def show
        if user_signed_in?
            @posts = Post.where('posts.user_id in
                                    (select friend_id
                                        from friendships as f, users as u
                                        where u.id = f.user_id and u.id = ?)', current_user.id)
        else
            @posts = Post.all
        end
    end
end
