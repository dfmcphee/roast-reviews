class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.belongs_to :user, index: true
      t.belongs_to :bean, index: true
      t.text :notes
      t.string :roast
      t.integer :sour
      t.integer :sweet
      t.integer :bitter
      t.integer :salty
      t.integer :rating

      t.timestamps
    end
  end
end
