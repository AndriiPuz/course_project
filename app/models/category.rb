class Category < ApplicationRecord
    has_many :operations, :dependent => :destroy

    validates :name, uniqueness: true, presence: true
    validates :description, presence: true
end
