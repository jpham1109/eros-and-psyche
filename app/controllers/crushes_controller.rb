class CrushesController < ApplicationController
    def index 
        @crushes = Crush.all
    end 

    def new 
        @crush = Crush.new
    end 

    def create 
        user = User.find(session[:user_id])
        zodiac = Zodiac.create().compatibility(user.dob, params[:crush][:dob], user.username, params[:crush][:name])

        @crush = Crush.create(name: params[:crush][:name], dob: params[:crush][:dob], compatibility: zodiac["data"]["result"]["Compatibility"]["Heading"], zodiac: Zodiac.last)

        
        if @crush.valid?

            flash[:notice] = "Crush added"
            redirect_to crush_path(@crush.id)
        else 
            flash[:errors] = @crush.errors.full_messages
            render :new
        end 
    end 

    def show 
        @crush = Crush.find(params[:id])
        @user = User.find(session[:user_id])
        @info = @crush.zodiac.compatibility(@user.dob, @crush.dob, @user.username, @crush.name)
        @sign = @info["data"]["result"]["partner"]["Sun Sign"]
        @symbol = @info["data"]["result"]["partner"]["Image"]
        @element = @info["data"]["result"]["partner"]["Element"]
        @quality = @info["data"]["result"]["partner"]["Quality"]
        @compatibility = @info["data"]["result"]["Compatibility"]["Heading"]
        @details = @info["data"]["result"]["Compatibility"]["Details"]
        @positive = @info["data"]["result"]["partner"]["Positive Traits"]
        @negative = @info["data"]["result"]["partner"]["Negative Traits"]
    end 

    def friend
        @crush = Crush.find(params[:id])
        @crush.update(friend: true)
        flash[:message] = "Added Friendzone!"


    end

    def destroy 
    end 

    private 
    
    def crush_params
        params.require(:crush).permit(:name, :dob)
    end
end
