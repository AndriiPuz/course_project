class Operation < ApplicationRecord
  belongs_to :category

  enum otype: [:income, :outlay]

  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :odate, presence: true
  validates :description, presence: true
end
