class UserCrushesController < ApplicationController

    def index 
        @user_crushes = UserCrush.all
    end 

    def new 
        @user = session[:user_id]
        @crush 
        @user_crush = UserCrush.new
    end 

    def create 
    end 

    def show 
    end 

    
end
