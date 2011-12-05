class CreateWatchTimes < ActiveRecord::Migration
  def change
    create_table :watch_times do |t|
      t.time :start
      t.time :end

      t.timestamps
    end

    create_table :users_watch_times, :id => false do |t|
      t.references :user
      t.references :watch_time
    end
  end
end
