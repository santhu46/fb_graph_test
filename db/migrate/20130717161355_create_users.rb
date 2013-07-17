class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :username
      t.string :gender
      t.integer :identifier
      t.string :hometown
      t.string :location

      t.timestamps
    end
  end
end
