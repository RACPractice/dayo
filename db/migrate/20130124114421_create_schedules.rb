class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.datetime :stating_date
      t.datetime :ending_date
      t.string :frequence

      t.timestamps
    end
  end
end
