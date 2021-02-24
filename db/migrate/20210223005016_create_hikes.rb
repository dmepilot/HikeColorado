class CreateHikes < ActiveRecord::Migration[6.0]
  def change
    create_table :hikes do |t|
      t.datetime :date
      t.integer :rating
      t.string :comments
      t.integer :user_id
      t.integer :trail_id

      t.timestamps
    end
  end
end
