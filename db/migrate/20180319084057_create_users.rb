class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :family_name, null: false, length: { maximum: 20 }
      t.string :given_name, null: false, length: { maximum: 20 }
      t.string :email, null: false

      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
