class CreateSightings < ActiveRecord::Migration
  def change
    create_table :sightings do |t|
      t.string        :spot,   null: false
      t.date          :date,   null: false
      t.timestamps             null: false
    end

    add_index :sightings, [:spot, :date], unique: true
  end
end
