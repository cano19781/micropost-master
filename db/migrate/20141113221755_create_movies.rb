class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.text :sinop
      t.string :genre
      t.integer :rating
      t.string :production
      t.integer :user_id
      t.integer :year
      t.string :duration
      t.string :director
      t.string :cast

      t.timestamps
    end
  end
end
