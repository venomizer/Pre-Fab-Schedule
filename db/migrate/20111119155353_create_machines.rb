class CreateMachines < ActiveRecord::Migration
  def change
    create_table :machines do |t|
      t.string :name

      t.timestamps
    end

    change_table :job_items do |t|
      t.references :machine
    end
  end
end
