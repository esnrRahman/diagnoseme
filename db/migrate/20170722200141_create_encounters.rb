class CreateEncounters < ActiveRecord::Migration[5.1]
  def change
    create_table :encounters do |t|
      t.integer :patient_id
      t.string :visit_no
      t.datetime :admitted_at
      t.datetime :discharged_at
      t.string :location
      t.string :room
      t.integer :bed
      t.belongs_to :patient, index: true

      t.timestamps
    end
  end
end
