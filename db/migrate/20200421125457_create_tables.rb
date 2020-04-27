class CreateTables < ActiveRecord::Migration[6.0]
  def change
    create_table :countries do |t|
      t.string :name,          null: false, limit: 250
      t.bigint :created_by_id, index: true
      t.bigint :updated_by_id, index: true

      t.timestamps
    end

    create_table :states do |t|
      t.string     :name,    null: false, limit: 250
      t.references :country, null: false
      t.bigint     :created_by_id, index: true
      t.bigint     :updated_by_id, index: true

      t.timestamps
    end

    create_table :cities do |t|
      t.string     :name,    null: false, limit: 250
      t.references :state,   null: false
      t.bigint     :created_by_id, index: true
      t.bigint     :updated_by_id, index: true

      t.timestamps
    end

    create_table :restaurants do |t|
      t.string     :name,               null: false, limit: 250
      t.string     :street_address,     null: false, limit: 250
      t.string     :phone_number,       null: false, limit: 250
      t.column     :delivery_type,      :string, null: false
      t.column     :food_type,          :string, null: false
      t.column     :delivery_emergency, :string, null: false
      t.string     :image
      t.references :city,               null: false
      t.references :state,              null: false
      t.references :country,            null: false
      t.bigint     :created_by_id,      index: true
      t.bigint     :updated_by_id,      index: true

      t.timestamps
    end

    create_table :foods do |t|
      t.string     :name, null: false, limit: 250
      t.column     :food_type,     :string, null: false
      t.column     :continental,   :string, null: false
      t.string     :image
      t.references :restaurant,    null: false
      t.bigint     :created_by_id, index: true
      t.bigint     :updated_by_id, index: true

      t.timestamps
    end
  end
end
