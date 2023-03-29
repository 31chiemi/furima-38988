class CreateShipments < ActiveRecord::Migration[6.0]
  def change
    create_table :shipments do |t|

      t.timestamps
    end
  end
end
