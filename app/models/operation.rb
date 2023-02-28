class Operation < ApplicationRecord
  belongs_to :category

  paginates_per 5

  enum otype: [:income, :outlay]

  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :odate, presence: true
  validates :description, presence: true

  scope :transfer_data, -> ( start_date, last_date, otype, category_id ) { where(odate: (start_date..last_date), otype: otype, category_id: category_id).group(:odate).sum(:amount) }
  scope :category_data, -> ( start_date, last_date, otype ) { where(odate: (start_date..last_date), otype: otype).group(:category_id).sum(:amount) }

  def self.search(search)
    if search
        joins(:category).where([" categories.name LIKE ? ", "%#{search}%"])
    else
        all
    end
  end
end
