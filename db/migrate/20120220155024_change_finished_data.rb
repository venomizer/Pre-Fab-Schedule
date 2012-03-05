class ChangeFinishedData < ActiveRecord::Migration
  def up
    add_column :jobs, :finished, :boolean
    add_column :job_items, :finished, :boolean
    remove_column :job_items, :finished_date

  end

  def down
    remove_column :jobs, :finished
    remove_column :job_items, :finished
    add_column :job_items, :finished_date, :date
  end
end
