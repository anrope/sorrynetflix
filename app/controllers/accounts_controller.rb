class AccountsController < ApplicationController
  def index
    @accounts = Account.all
  end

  def show
    @account = Account.find(params[:id])
  end

  def new
    @account = Account.new
  end
  
  def create
    @account = Account.new(params[:account])

    if @account.save
      redirect_to accounts_path, :notice => "Account added."
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
