class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name,            null: false, limit: 250
      t.string :email,           null: false, limit: 250
      t.string :password_digest
      t.string :phone_number,    limit: 100
      t.string :remember_digest

      t.timestamps
    end
  end
end
