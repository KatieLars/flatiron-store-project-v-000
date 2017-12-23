class Categories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :title
    end
  end
end
