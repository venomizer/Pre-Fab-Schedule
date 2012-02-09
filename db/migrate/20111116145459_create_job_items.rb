class CreateJobItems < ActiveRecord::Migration
  def change
    create_table :job_items do |t|
      t.string :description
      t.string :drawing_number
      t.integer :quantity
      t.date :finished_date
      t.references :job
      t.timestamps
    end
  end
end
