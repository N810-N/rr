class CreateSleepChecks < ActiveRecord::Migration[7.1]
  def change
    create_table :sleep_checks do |t|
      t.integer :user_id
      t.integer :score
      t.string :quality
      t.text :note

      t.timestamps
    end
  end
end
