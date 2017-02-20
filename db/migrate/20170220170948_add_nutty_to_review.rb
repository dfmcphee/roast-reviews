class AddNuttyToReview < ActiveRecord::Migration[5.0]
  def change
    add_column :reviews, :nutty, :integer
  end
end
