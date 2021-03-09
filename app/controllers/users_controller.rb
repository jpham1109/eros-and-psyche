class UsersController < ApplicationController
    skip_before_action :authorized, only: [:login, :new, :create, :show, :login_helper]

    def new 
        @user = User.new
    end 

    def create 
        zodiac = Zodiac.create().user(params[:user][:dob], params[:user][:username])
    
        @user = User.create(username: params[:user][:username], password: params[:user][:password], dob: params[:user][:dob], zodiac: Zodiac.last)
        byebug
        if @user.valid?
            
            flash[:notice] = "Account created successfully!"
            redirect_to user_path(@user.id) 
        else
            flash[:errors] = @user.errors.full_messages
            render :new
        end 
    end 

    def login
    end 

    def handle_login 
        byebug
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id 
            redirect_to user_path(@user)
        else 
            flash[:errors] = @user.errors.full_messages
            redirect_to login_path
        end 
    end 

    def show 
        @user = User.find(params[:user_id])
    end 

    private 

    def user_params
        params.require(:user).permit(:username, :password, :password_confirmation, :dob)
    end 

    
end
