class UsersController < ApplicationController
    before_action :authenticate_user!, :only => [:show, :index]
    def index
        if params[:search] == nil
            @users=User.all
        elsif params[:search] == ''
            @users= User.all
        else
            #部分検索
            @users = User.where("name LIKE ? ",'%' + params[:search] + '%').order(created_at: :desc)
        end
    end

    def show
        @user=User.find(params[:id])
        @currentUserEntry=Entry.where(user_id: current_user.id)
        @userEntry=Entry.where(user_id: @user.id)
        if @user.id == current_user.id
        else
            @currentUserEntry.each do |cu|
                @userEntry.each do |u|
                    if cu.room_id == u.room_id then
                        @isRoom = true
                            @roomId = cu.room_id
                    end
                end
            end
            if @isRoom
            else
                @room = Room.new
                @entry = Entry.new
            end

        #     @followings = current_user.following
        #     @followings.each do |f|
        #         if f.id ==@user.id
        #         end
        #     end
        end
        def followings
            @user=User.find(params[:id])
            # @users = @user.followings
        end
        def followers
            @user=User.find(params[:id])
            # @users = @user.followers
        end
        
        
    end

end
