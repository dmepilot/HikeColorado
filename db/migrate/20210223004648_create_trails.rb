class CreateTrails < ActiveRecord::Migration[6.0]
  def change
    create_table :trails do |t|
      t.string :name
      t.string :length
      t.string :difficulty
      t.string :dogs
      t.string :notes

      t.timestamps
    end
  end
end
