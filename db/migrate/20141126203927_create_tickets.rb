class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.integer :client_id
      t.string :problem
      t.integer :user_id
      t.integer :status

      t.timestamps
    end
  end
end
