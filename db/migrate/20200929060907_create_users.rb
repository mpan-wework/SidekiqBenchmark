class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.uuid :uuid, null: false, default: 'uuid_generate_v4()'
      t.string :name
      t.string :phone
      t.string :email

      t.timestamps
    end
  end
end
