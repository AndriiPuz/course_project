class Account < ApplicationRecord
  include Rodauth::Rails.model
  enum :status, unverified: 1, verified: 2, closed: 3
  has_many :categories, dependent: :destroy
  has_many :operations
  has_one :profile
end
