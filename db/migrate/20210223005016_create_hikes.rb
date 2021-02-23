class CreateHikes < ActiveRecord::Migration[6.0]
  def change
    create_table :hikes do |t|
      t.datetime :date
      t.integer :rating
      t.string :comments

      t.timestamps
    end
  end
end
