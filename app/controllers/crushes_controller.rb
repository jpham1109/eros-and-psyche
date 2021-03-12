class CrushesController < ApplicationController
    def index 
        @crushes = Crush.where(friend: true)
    end 

    def new 
        @crush = Crush.new
    end 

    def create 
        user = User.find(session[:user_id])
        zodiac = Zodiac.create().compatibility(user.dob, params[:crush][:dob], user.username, params[:crush][:name])

        @crush = Crush.create(name: params[:crush][:name], dob: params[:crush][:dob], compatibility: zodiac["data"]["result"]["Compatibility"]["Heading"], sign: zodiac["data"]["result"]["partner"]["Sun Sign"], symbol: zodiac["data"]["result"]["partner"]["Image"], element: zodiac["data"]["result"]["partner"]["Element"], quality: zodiac["data"]["result"]["partner"]["Quality"], details: zodiac["data"]["result"]["Compatibility"]["Details"], positive: zodiac["data"]["result"]["partner"]["Positive Traits"], negative: zodiac["data"]["result"]["partner"]["Negative Traits"], zodiac: Zodiac.last)

        
        if @crush.valid?
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
    end 

    def friend
        @crush = Crush.find(params[:id])
        @crush.update(friend: true)
        flash[:message] = "Added Friendzone!"
        redirect_to crushes_path
    end

    def destroy 
        @crush = Crush.find(params[:id])
        @crush.destroy
        flash[:message] = "Deleted this Crush, bye bye!"
        redirect_to user_path(@current_user)
    end 

    private 
    
    # def crush_params
    #     params.require(:crush).permit(:name, :dob)
    # end
end
