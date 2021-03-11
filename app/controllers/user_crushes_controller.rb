class UserCrushesController < ApplicationController

    def index 
        @user_crushes = @current_user.user_crushes
    end 

    def new
        @errors = flash[:errors]
        @user = session[:user_id]
        @crush = Crush.last
        @user_crush = UserCrush.new
    end 

    def create 
        # @user_crush = UserCrush.create(crush_level: params[:user_crush][:crush_level], crush_id: params[:user_crush][:crush_id], user_id: @current_user.id)
        @user = session[:user_id]
        @crush = Crush.find_by(params[:id])
        @user_crush = @current_user.user_crushes.create(crush_level: params[:user_crush][:crush_level], crush_id: @crush.id, user_id: @user)
        
        if @user_crush.valid?
        redirect_to user_crushes_path
        else 
        flash[:errors] = "Unsuccessful, try again please!"
        render :new 
        end
    end 

    def show 
        @user_crush = UserCrush.find(params[:id])
    end 

    def destroy

    end
    
end
