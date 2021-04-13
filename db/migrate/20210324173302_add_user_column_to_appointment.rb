class AddUserColumnToAppointment < ActiveRecord::Migration[6.1]
  def change
    add_reference :appointments, :user, null: false, foreign_key: true
  end
end
