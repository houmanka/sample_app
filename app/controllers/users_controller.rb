class UsersController < ApplicationController


  def show
  	# raise params.inspect
  	@user = User.find(params[:id])
  end

  def new
  	# we make a blank user here before coding the form as Rails do some cool things with this
  	@user = User.new 
  end

  def create
  	@user = User.new(params[:user])
  	if @user.save
      flash[:success] = "Welcome to the Sample Application!"
  		redirect_to @user
  	else
  		render 'new'
  	end	
  end
end
