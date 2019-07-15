class CreateTroubles < ActiveRecord::Migration
  def change
    create_table :troubles do |t|
      t.integer :client_id
      t.string :title
      t.text :text
      t.integer :user_id
      t.string :severity
      t.string :state
      t.string :category

      t.timestamps
    end
  end
end
