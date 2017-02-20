class CreateRoasters < ActiveRecord::Migration[5.0]
  def change
    create_table :roasters do |t|
      t.text :name
      t.text :description
      t.string :location

      t.timestamps
    end
  end
end
