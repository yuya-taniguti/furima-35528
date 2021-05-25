class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string     :postal_code,     null: false
      t.integer    :regional_id,     null: false
      t.string     :municipality,    null: false
      t.string     :address,         null: false
      t.string     :phone_number,    null: false
      t.string     :building_name
      t.references :history,         null: false, foreign_key: true
      t.timestamps
    end
  end
end
