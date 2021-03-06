class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :title
      t.string :email
      t.integer :phone_number
      t.references :customer
      t.timestamps
    end
  end
end
