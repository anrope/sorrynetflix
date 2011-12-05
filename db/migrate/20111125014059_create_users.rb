class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :password

      t.references :account

      t.timestamps
    end
  end
end
