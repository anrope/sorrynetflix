class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :password
      t.time :use_time

      t.references :account

      t.timestamps
    end
  end
end
