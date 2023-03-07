class AddOtypeToOperations < ActiveRecord::Migration[7.0]
  def change
    add_column :operations, :otype, :integer, default: 0
  end
end
