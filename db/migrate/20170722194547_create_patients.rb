class CreatePatients < ActiveRecord::Migration[5.1]
  def change
    create_table :patients do |t|
      t.string :mrn
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.integer :weight
      t.integer :height

      t.timestamps
    end
  end
end
