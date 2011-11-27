class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])

    if @user.save
      redirect_to users_path, :notice => "User added."
    else
      render "new"
    end
  end
  
  def edit

  end

  def update

  end

  def destroy

  end
end
