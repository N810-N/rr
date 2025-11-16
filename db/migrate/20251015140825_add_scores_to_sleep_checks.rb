class AddScoresToSleepChecks < ActiveRecord::Migration[7.1]
  def change
    add_column :sleep_checks, :rhythm, :integer
    add_column :sleep_checks, :quantity, :integer
    add_column :sleep_checks, :overall_quality, :string
  end
end
