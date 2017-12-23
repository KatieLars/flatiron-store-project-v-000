class Carts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.string :status, default: "unsubmitted"
      t.integer :user_id
    end
  end
end
