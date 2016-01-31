class UsersController < ApplicationController
    def index
        @users = User.all
        @friendship = Friendship.all
    end

    def show
        @user = User.find(params[:id])
        @my_posts = @user.posts
        @my_friends = @user.friends
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        respond_to do |format|
            if @user.update(user_params)
                format.html { redirect_to @user, notice: 'User was successfully updated.' }
                format.json { render :show, status: :ok, location: @user }
            else
                format.html { render :edit }
                format.json { render json: @post.errors, status: :unprocessable_entity }
            end
        end
    end

    def user_params
        params.require(:user).permit(:name)
    end
end
