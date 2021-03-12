class UsersController < ApplicationController
    skip_before_action :authorized, only: [:login, :handle_login, :new, :create, :show, :login_helper]

    def new 
        @errors = flash[:errors]
        @user = User.new
    end 

    def create 
        @errors = flash[:errors]

        zodiac = Zodiac.create().user(params[:user][:dob], params[:user][:username])
    
        @user = User.create(username: params[:user][:username], password: params[:user][:password], dob: params[:user][:dob], sign: zodiac["data"]["result"]["Your Sun Sign"]["Sun Sign"], element: zodiac["data"]["result"]["Your Zodiac Details"]["Zodiac Element"], quality: zodiac["data"]["result"]["Your Zodiac Details"]["Zodiac Quality"], traits: zodiac["data"]["result"]["Traits"]["General Traits"], famous: zodiac["data"]["result"]["Famous Personalities"], zodiac: Zodiac.last)

        if @user.valid?
            session[:user_id] = @user.id 
            flash[:notice] = "Account created successfully!"
            redirect_to user_path(@user.id) 
        else
            flash[:errors] = @user.errors.full_messages
            render :new
        end 
    end 

    def login
        @errors = flash[:errors]
    end 

    def handle_login 
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id 
            redirect_to user_path(@user)
        else 
            flash[:errors] = "Login unsuccessfully. Try harder!"
            redirect_to login_path
        end 
    end 

    def show 
        @user = User.find(params[:id])
        @info = @user.zodiac.user(@user.dob, @user.username)
    end 

    def logout
        session[:user_id] = nil
        redirect_to login_path
    end

    private 

    def user_params
        params.require(:user).permit(:username, :password, :password_confirmation, :dob)
    end 

    
end
