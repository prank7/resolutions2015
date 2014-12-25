class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :uid
      t.string :name
      t.string :email
      t.boolean :notification
      t.string :image
      t.string :resolution_image
      t.date :startdate

      t.timestamps
    end
  end
end
