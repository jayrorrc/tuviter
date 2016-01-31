class FriendshipsController < ApplicationController
  before_action :set_friendship, only: [:destroy]

  # POST /friendships
  # POST /friendships.json
    def create
        @friendship = current_user.friendships.build(:friend_id => params[:id])
        
        if @friendship.save
            flash[:notice] = "Added friend."
            redirect_to root_path
        else
            flash[:error] = "Unable to add friend."
            redirect_to root_path
        end
    end

  # DELETE /friendships/1
  # DELETE /friendships/1.json
    def destroy
        @friendship = Friendship.find(params[:id])
        @friendship.destroy
        
        flash[:notice] = "Removed friendship."
        redirect_to root_path
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_friendship
        @friendship = Friendship.find(params[:id])
    end
end
