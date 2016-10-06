class AccountsController < ApplicationController
  before_action :authenticate_user!

  def show
    current_user
    @account = Account.find(params[:id])
    @events = current_user.events
  end

  def new
    @account = Account.new
  end

  def create
    current_user
    @account = Account.new(account_params)
    @account.user_id = current_user.id
    if @account.save
      current_user.account_id = @account.id
      current_user.save
      flash[:notice] = "Thanks for creating an account."
      redirect_to account_path(@account)
    else
      render :new
    end
  end

  def edit
    @account = Account.find(params[:id])
  end

  def update
    @account = Account.find(params[:id])
    if @account.update(account_params)
      flash[:notice] = "Account successfully updated!"
      redirect_to account_path(@account)
    else
      render :edit
    end
  end

  def destroy
    @account = Account.find(params[:id])
    @account.destroy
    flash[:alert] = "We're sad to see you go.  Join us again soon!"
    redirect_to root_path
  end

  private
  def account_params
    params.require(:account).permit(:first_name, :last_name, :avatar)
  end
end
