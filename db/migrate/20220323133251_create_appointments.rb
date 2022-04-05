class CreateAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :appointments do |t|
      t.integer :people
      t.datetime :schedule

      t.timestamps
    end
  end
end
