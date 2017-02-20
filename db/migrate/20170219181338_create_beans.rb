class CreateBeans < ActiveRecord::Migration[5.0]
  def change
    create_table :beans do |t|
      t.belongs_to :roaster, index: true
      t.text :name
      t.text :description
      t.string :roast

      t.timestamps
    end
  end
end
