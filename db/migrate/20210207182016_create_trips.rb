class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.references  :cab,        null: false, index: true
      t.references  :user,       null: false, index: true
      t.timestamp  :start_time, null: false
      t.timestamp  :end_time
      t.timestamps
    end
  end
end
