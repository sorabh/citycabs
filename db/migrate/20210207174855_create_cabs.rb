class CreateCabs < ActiveRecord::Migration[5.2]
  def change
    create_table :cabs do |t|
      t.integer :state, null: false, default: 0, index: true
      t.references :city
      t.timestamps
    end
    add_index :cabs, [:city, :state]
  end
end
