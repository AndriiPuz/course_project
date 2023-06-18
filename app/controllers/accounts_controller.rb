class AccountsController < ApplicationController
  def home
    if current_account.role == 'admin'
      # Perform admin-specific actions
      @accounts = Account.all.page(params[:page])
    else
      # Handle non-admin users
      redirect_to root_path, alert: 'You are not authorized to access this page.'
    end
  end

  def close_account
    account = Account.find(params[:account_id])
    # Handle associated records with foreign key constraints
    account.categories.destroy_all
    account.operations.destroy_all
    account.profile.destroy
    # Finally, delete the account
    account.destroy
    redirect_to root_path, notice: "Account deleted successfully"
  end
end
