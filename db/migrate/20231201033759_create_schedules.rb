class CreateSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :schedules do |t|
      t.string :name
      t.date :start_date
      t.date :end_date
      t.boolean :is_all_day
      t.string :memo

      t.timestamps
    end
  end
end
