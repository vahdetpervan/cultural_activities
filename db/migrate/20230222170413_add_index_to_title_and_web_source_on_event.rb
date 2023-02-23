class AddIndexToTitleAndWebSourceOnEvent < ActiveRecord::Migration[7.0]
  def change
    add_index :events, [:title, :start_date], unique: true
  end
end
