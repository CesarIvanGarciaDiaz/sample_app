class AccountsController < ApplicationController
 before_filter :require_login



  def index
    @accounts = Account.order(:name)
    @account=Account.new
  end

  def new
    @account = Account.new
  end

  def edit
     @account=Account.find(params[:id])

  end

  def create
    @account = Account.new(account_params)
    respond_to do |format|
      if @account.save

# flash[:success] = "Creado Correctamente"
  # redirect_to user_accounts_path(session[:user_id])
    format.js
else
    format.js

end
      end
  end

  def update
    # @account=Account.find(params[:id])
    # if @account.update_attributes(account_params)
    # @account.save
    #   flash[:success] = "Account was successfully updated."
    # redirect_to user_accounts_path(session[:user_id])
    # else
    #   render 'edit'
    # end

@account = Account.update(params[:id], account_params)
if @account.save
  flash[:success] = "Account was successfully updated."
  redirect_to user_accounts_path(session[:user_id])
end
  end

  def destroy
    @account=Account.find(params[:id])
    @account.destroy
    flash[:success] = "Account was successfully destroyed."
    redirect_to user_accounts_path(session[:user_id])
  end

private
def account_params
  params.require(:account).permit(:name)
end

def require_login
  unless current_user
  flash[:danger] = "Please log in."
    redirect_to login_url
  end
end

end
