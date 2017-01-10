class AccountsController < ApplicationController

  def index
    @accounts = Account.all
  end

  def new
    @account = Account.new
  end

  def edit
     @account=Account.find(params[:id])

  end

  def create
    @account = Account.new(account_params)
    if @account.save
      flash[:success] = "Creado Correctamente"
      redirect_to user_accounts_path(session[:user_id])
    else
      render 'new'
    end
  end

  def update
    @account=Account.find(params[:id])
    if @account.update_attributes(account_params)
    @account.save
      flash[:success] = "Account was successfully updated."
      render 'home'
    else
      render 'edit'
    end
  end

  def destroy
    @account=Account.find(params[:id])
    @account.destroy
    flash[:success] = "Account was successfully destroyed."
    redirect_to user_accounts_path(session[:user_id])
  end
end

private
def account_params
  params.require(:account).permit(:name)

end
