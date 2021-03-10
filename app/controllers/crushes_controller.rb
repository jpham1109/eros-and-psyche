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

        @crush = Crush.create(name: params[:crush][:name], dob: params[:crush][:dob], zodiac: Zodiac.last)
        
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
        @data = @crush.zodiac.compatibility(@user.dob, @crush.dob, @user.username, @crush.name)
    end 

    def destroy 
    end 

    private 
    
    def crush_params
        params.require(:crush).permit(:name, :dob)
    end
end
