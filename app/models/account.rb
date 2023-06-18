class Account < ApplicationRecord
  include Rodauth::Rails.model
  enum :status,verified: 1, unverified: 2, closed: 3
  has_many :categories, dependent: :destroy
  has_many :operations
  has_one :profile
  enum role: [:user, :admin]

  def admin?
    role == 'admin'
  end
  def close_account
    account = Account.find(params[:account_id])
    account.close_account
    redirect_to root_path, notice: "Account deleted successfully"
  end

  paginates_per 3
end
