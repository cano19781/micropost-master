class CreateComen < ActiveRecord::Migration
  def change
    create_table :comen do |t|
      t.string :commenter
      t.text :body
      t.references :movie

      t.timestamps
    end
    add_index :comen, :movie_id
  end
end
