class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
    @watchtime = WatchTime.new
  end
  
  def create
    @user = User.new(params[:user])
    @watchtime = WatchTime.new(params[:watch_time])

    if @user.save
      if @watchtime.save
        @user.watch_times<< @watchtime
        redirect_to users_path, :notice => "User added."
      end
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
