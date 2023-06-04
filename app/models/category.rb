class Category < ApplicationRecord
  belongs_to :account
  has_many :operations, :dependent => :destroy

  paginates_per 5

  validates :name, uniqueness: true, presence: true
  validates :description, presence: true

  def self.search(search)
      if search
          where(["name LIKE ? ", "%#{search}%"])
      else
          all
      end
  end
end