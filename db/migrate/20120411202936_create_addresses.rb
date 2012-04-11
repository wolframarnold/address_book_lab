class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :city
      t.string :state
      t.string :street
      t.string :zip
      t.belongs_to :user

      t.timestamps
    end
    add_index :addresses, :user_id
  end
end
