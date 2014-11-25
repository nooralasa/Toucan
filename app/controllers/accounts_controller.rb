class AccountsController < ApplicationController

  
  def index
    
  end

  def show
  end

  def new
  	
  end

  def create
  	@account = Account.new(account_params)
  	if @account.save
  		redirect_to(:action => 'index')
  	
  	else 
  		render('signin')
  	end
  end

  def edit
  end

  def delete
  end

  private 
  def account_params
  	params.require(:account).permit(:first_name, :last_name, :email, :password)
  end
end

