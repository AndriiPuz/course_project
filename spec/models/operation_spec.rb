require 'rails_helper'

RSpec.describe Operation, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

RSpec.describe Operation, type: :model do
  let(:category) { Category.create(name: 'Test Category', description: "Test description") }
  subject { Operation.new( amount: "9.99", odate: "2023-01-27 14:06:43" , description: "MyString", otype: 0, category_id: category.id)}
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  it "is not valid without a amount" do
    subject.amount = nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a description" do
    subject.description = nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a odate" do
    subject.odate = nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a id" do
    subject.category_id = nil
    expect(subject).to_not be_valid
  end
end

describe Operation do
  it { should belong_to(:category)}
end

describe Operation do
  it 'validates presence and numericality of number greater than zero' do
    should validate_presence_of(:amount)
    should validate_numericality_of(:amount)
    should allow_value(1).for(:amount)
    should_not allow_value(0).for(:amount)
    should_not allow_value(-1).for(:amount)
  end
end


RSpec.describe Operation, type: :model do
  describe 'search' do
    let(:category) { Category.create(name: 'Test Category', description: 'Food_1') }
    let(:operation1) { Operation.create(amount: "100", odate: "2022-09-08", description: "something", otype: 0, category_id: category.id) }
    let(:operation2) { Operation.create(amount: "322", odate: "2021-10-15", description: "some", otype: 0, category_id: category.id) }

    context 'when searching for operations by category name' do
      it 'returns operations with the given category name' do
        result = Operation.search('Test Category')
        expect(result).to include(operation1, operation2)
      end
      it 'does not return operations with different category name' do
        result = Operation.search('Other Category')
        expect(result).to_not include(operation1, operation2)
      end
    end
  end
end