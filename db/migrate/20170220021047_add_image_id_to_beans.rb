class AddImageIdToBeans < ActiveRecord::Migration[5.0]
  def change
    add_column :beans, :image_uid, :string
    add_column :beans, :image_name, :string
  end
end
