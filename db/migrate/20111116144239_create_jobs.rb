class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :number
      t.integer :priority
      t.integer :quantity
      t.date :due_date
      t.references :customer
      t.timestamps
    end
  end
end
