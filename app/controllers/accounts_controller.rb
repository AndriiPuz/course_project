class AccountsController < ApplicationController
  def home
    if current_account.role == 'admin'
      # Perform admin-specific actions
      @accounts = Account.all
    else
      # Handle non-admin users
      redirect_to root_path, alert: 'You are not authorized to access this page.'
    end
  end
end
