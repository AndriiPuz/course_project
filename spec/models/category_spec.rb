require 'rails_helper'

RSpec.describe Category, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end


RSpec.describe Category, type: :model do
  subject { Category.new( name: "first_category", description: "first_description")}
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  it "is not valid without a name" do
    subject.name = nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a description" do
    subject.description = nil
    expect(subject).to_not be_valid
  end
  describe 'validations' do
    it { should validate_uniqueness_of(:name) }
  end
end

describe Category do
  it { should have_many(:operations)}
end


RSpec.describe Category, type: :model do
  describe 'search' do
    it 'returns a list of categories with matching names' do
      category1 = Category.create(name: 'Category 1', description: '1st_desk')
      category2 = Category.create(name: 'Category 2', description: '2nd_desk')
      category3 = Category.create(name: 'Another ', description: '3rd_desk')

      search_term = 'Category'
      categories = Category.search(search_term)

      expect(categories.length).to eq(2)
      expect(categories).to include(category1)
      expect(categories).to include(category2)
      expect(categories).not_to include(category3)
    end
  end
end