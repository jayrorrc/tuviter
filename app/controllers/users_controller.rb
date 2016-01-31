class UsersController < ApplicationController
    def perfil
        @user = User.find(params[:id])
        @my_posts = @user.posts
    end
end